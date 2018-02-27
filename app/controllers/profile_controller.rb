require 'pry'

class ProfileController < ApplicationController
<<<<<<< HEAD
	def getProblems(cat_uid)
		# returns all problem_uids of problems from category with cat_uid
		# PracticeProblem.where(category_uid: cat_uid).distinct.pluck(:problem_uid)
		PracticeProblem.distinctProblemUids(cat_uid)
	end

	def profilePage
		# binding.pry
		@topics = ProblemCategory.topics
=======
	def profilePage
		if params[:id] 
			@user = User.find(params[:id]) 
		else
			@user = current_user
		end
>>>>>>> induction
	end

	helper_method :getProblems
end

