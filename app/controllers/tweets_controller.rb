class TweetsController < ApplicationController
	#method to create a tweet
	def create
		if current_user.present?
			tweet = current_user.tweets.create(tweet_params)
			render json: {:status=>"success", :code=>200, :message=>"Tweet created successfully!", data: tweet}
		end
	end

	#method to get a list of tweets user follow
	def index
		user = User.find_by(id: params[:user_id])
		if user.present?
			follower_ids = user.followers.pluck(:id)
			tweets = Tweet.where("user_id IN (?)", follower_ids).order("updated_at DESC")
			render json: {:status=>"success", :code=>200, :message=>"List of tweets from the users you follow.", data: tweets}
		else
			render json: {:status=>"failure", :message=>"User is not present.", data: tweets}
		end
	end

	private

	def tweet_params
		params.require(:tweet).permit(:content, :user_id)
	end
end
