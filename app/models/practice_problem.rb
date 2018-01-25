class PracticeProblem < ApplicationRecord
	def self.distinctProblemUids(cat_uid)
		where(category_uid: cat_uid).distinct.pluck(:problem_uid)
	end
end
