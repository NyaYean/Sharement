class UsersController < ApplicationController
	def index
		render json: User.all
	end

	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name, :password, :password_confirmation, :address, :city, :state, :postal_code, :phone_number)
	end
end