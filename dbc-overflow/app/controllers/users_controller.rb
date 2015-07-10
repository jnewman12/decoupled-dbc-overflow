class UsersController < ApplicationController

	before_action :allow_cross_domain

	def new 
		@user = User.new
		respond_with @user
	end

	def create
	  respond_with @user = User.create!(user_params)
	  # create! because it will throw an exception if it fails
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def allow_cross_domain
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    end
end