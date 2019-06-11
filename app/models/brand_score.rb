class BrandScore < ApplicationRecord

	def friendly_score
		return (score*100).round(0)
	end

	def friendly_date
		return created_at.strftime('%A, %b %d')
	end

	def percentage_score
		# Convert score in -100-100 range to a percentage value
		return (((friendly_score-(-100))/200)*100)
	end

end
