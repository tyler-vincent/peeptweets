class BrandScore < ApplicationRecord

	def friendly_score
		return (score*100).round(0)
	end

end
