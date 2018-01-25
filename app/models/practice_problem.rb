class PracticeProblem < ApplicationRecord
	def self.distinctProblemUids(cat_uid)
		probs = where(category_uid: cat_uid).distinct.pluck(:problem_uid)
		return probs
	end
end
