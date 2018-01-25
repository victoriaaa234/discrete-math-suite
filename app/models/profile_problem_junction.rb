class ProfileProblemJunction < ApplicationRecord
	def self.problemsSolved(user_id)
		where(profile_uid: user_id).distinct.pluck(:problem_uid)
	end
end
