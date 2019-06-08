class TwitterService

	def initialize
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['CONSUMER_KEY']
		  config.consumer_secret     = ENV['CONSUMER_SECRET']
		  config.access_token        = ENV['ACCESS_TOKEN']
		  config.access_token_secret = ENV['ACCESS_SECRET']
		end

		@analyzer = Sentimental.new
		analyzer.load_defaults
	end

	def client
		return @client
	end

	def analyzer
		return @analyzer
	end

	def search_and_rate_sentiment(term)
		combined_sentiments = [*verified_search_sentiments(term), *fulltext_search_sentiments(term)]

		# Average combined sentiment
		return combined_sentiments.sum.fdiv(combined_sentiments.size)
	end

	private

	def find_verified_users(term)
		# Find verified users related to search term
		users = client.user_search(term)
		users.keep_if {|user| user.verified? }
		return users
	end


	def verified_search_sentiments(term)
		sentiments = []

		# Find verified users related to search term (e.g. @FedExHelps) and analyze recent tweets @ them
	 	verified_users = find_verified_users(term)

	 	verified_users.each do |user|
		 	client.search("to:#{user.name} OR @#{user.name}", :result_type => "recent", :lang => 'en').take(20).each do |tweet|
			  sentiments << analyzer.score(tweet.full_text)
			end
	 	end

	 	return sentiments
	end

	def fulltext_search_sentiments(term)
		sentiments = []

	 	# Do a broader full text search for the term
		# Only return a limited result set to avoid API limits
		results = client.search(term, :lang => 'en', :include_entities => false).take(100)

		# Attempt to roughly filter out tweets coming from accounts matching the term
		results.delete_if {|tweet| tweet.user.name.downcase.include?(term.downcase) }

		results.each {|tweet| sentiments << analyzer.score(tweet.full_text)}

		return sentiments 
	end

end