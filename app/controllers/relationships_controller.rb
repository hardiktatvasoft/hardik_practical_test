class RelationshipsController < ApplicationController
	#method to follow a user
	def create
		user = User.find_by(id: params[:followed_id])
		if current_user.present?
			if current_user.following?(user)
				render json: {:status=>"failure", :message=>"Already following."}

			else
				relationship = current_user.follow(user)
				render json: {:status=>"success", :code=>200, :message=>"Followed this user successfully.", data: relationship}
			end
		else
			render json: {:status=>"failure", :message=>"No any user present.", data: relationship}
		end
	end

	#method to unfollow a user
	def destroy
		user = Relationship.find(params[:id]).followed
		if current_user.present?
			relationship = current_user.unfollow(user)
			render json: {:status=>"success", :code=>200, :message=>"User unfollwed successfully.", data: relationship}
		else
			render json: {:status=>"failure", :message=>"No any user present.", data: relationship}
		end
	end

	#method to get user profile
	def user_profile
		if current_user.present?
			user_followers = current_user.followers
			user_followings = current_user.following
			render json: {:status=>"success", :code=>200, :message=>"List of users followers and following.", data: {followers: user_followers, followings: user_followings}}
		end
	end
end
