class UsersController < ApplicationController
	
	def index
		@users = User.all

		render json: {
			status: :true,
			users: @users
		}
	end

end

## Route
# users GET  /users(.:format)  users#index

## Get format on curl
# curl http://localhost:3000/users
# curl --request GET http://localhost:3000/users
