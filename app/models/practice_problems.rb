class PracticeProblems < ActiveRecord::Base
	attr_reader :premise,:problem,:conclusion

	def self.generate()
		self.order("Random()").first
	end
	
end