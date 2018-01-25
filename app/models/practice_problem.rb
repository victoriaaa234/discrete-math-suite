class PracticeProblem < ApplicationRecord
	def self.distinctProblemUids(cat_uid)
		where(category_uid: cat_uid).distinct.pluck(:problem_uid)
	end

	def self.getPremisesAndConclusion(prob_uid)
		where(problem_uid: prob_uid).pluck(:premises, :conclusion)
	end
end
