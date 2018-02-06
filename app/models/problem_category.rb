class ProblemCategory < ApplicationRecord
	def self.topics
		return distinct.pluck(:category_uid, :category_name, :category_description)
	end
end
