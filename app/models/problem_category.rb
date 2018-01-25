class ProblemCategory < ApplicationRecord
	def self.topics
		return distinct.pluck(:category_uid, :category_name)
	end
end
