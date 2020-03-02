# README

APIs:
Signup, Login, Logout, Follow user, Unfollow user, Create tweet, List if tweets by user id, User profile (User's followers and following)

List of parameters to check APIs:

1) Signup
localhost:3000/users
Method: Post
Haders: Content-Type - application/json

Body: 
row
{
	"user":{
		"email": "abc@yopmail.com",
		"password": "123456",
		"password_confirmation": "123456"
	}
}

2) Login
localhost:3000/oauth/token
Method: Post
Haders: Content-Type - application/json

Body: 
row
{
	"email": "abc@yopmail.com",
	"password": "123456",
	"grant_type": "password"
}

3) Logout
localhost:3000/oauth/revoke
Method: Post
Haders: Content-Type - application/json

Body: 
row
{
	"token": "xBUJSD06C5I8WZQhZEj6_t0G6bHWIpoV-otqPQyc6pw"
}

4) Follow user
localhost:3000/relationships
Method: Post
Haders: 
Content-Type - application/json
Authorization: Bearer xBUJSD06C5I8WZQhZEj6_t0G6bHWIpoV-otqPQyc6pw

Body:
x-www-form-urlencoded

Key: followed_id
Value: 1

5) Unfollow user
localhost:3000/relationships/1
Method: Delete
Haders: 
Content-Type - application/json
Authorization: Bearer xBUJSD06C5I8WZQhZEj6_t0G6bHWIpoV-otqPQyc6pw

6) Create Tweet
localhost:3000/tweets
Method: Post
Haders: 
Content-Type - application/json
Authorization: Bearer xBUJSD06C5I8WZQhZEj6_t0G6bHWIpoV-otqPQyc6pw

Body:
x-www-form-urlencoded

Key: tweet[content]
Value: Hello this is first tweet

7) List if tweets by user id
localhost:3000/tweets?user_id=1
Method: Get
Haders: 
Content-Type - application/json
Authorization: Bearer xBUJSD06C5I8WZQhZEj6_t0G6bHWIpoV-otqPQyc6pw

8) User profile (User's followers and following)
localhost:3000/user_profile
Method: Get
Haders: 
Content-Type - application/json
Authorization: Bearer xBUJSD06C5I8WZQhZEj6_t0G6bHWIpoV-otqPQyc6pw