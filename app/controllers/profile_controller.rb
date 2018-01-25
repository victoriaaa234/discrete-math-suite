require 'pry'

class ProfileController < ApplicationController
	def getProblems(cat_uid)
		# returns all problem_uids of problems from category with cat_uid
		PracticeProblem.where(category_uid: cat_uid).distinct.pluck(:problem_uid)
	end

	def profilePage
		# binding.pry
		@topics = ProblemCategory.distinct.pluck(:category_uid, :category_name)
	end

	helper_method :getProblems
end

