class PracticeProblems < ActiveRecord::Base

	# TODO
	# This model should be deprecated for the PracticeProblem (singular) model

	def self.generate()
		return self.order("Random()").first
	end
	
	def to_s()
		"Premise:#{self.premise}|Problem:#{self.problem}|Conclusion:#{self.conclusion}|ID:#{self.id}"
	end
end
