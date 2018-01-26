require 'pry'

class InstructorController < ApplicationController
	def instructor
		# binding.pry
		@users = User.instructor_list()
	end

	helper_method :getProblems
end

