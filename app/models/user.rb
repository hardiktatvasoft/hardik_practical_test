class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #relationship for following
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  #relationship for followers
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  #relationship for tweet
  has_many :tweets

  #check user's authentication
  def self.authenticate(email, password)
  	user = User.find_for_authentication(email: email)
  	user.try(:valid_password?, password) ? user : nil
  end

  #follow a user
  def follow(other_user)
  	following << other_user
  end

  #unfollow a user
  def unfollow(other_user)
  	following.delete(other_user)
  end

  #if current user is following other user, it will return true
  def following?(other_user)
  	following.include?(other_user)
  end
end
