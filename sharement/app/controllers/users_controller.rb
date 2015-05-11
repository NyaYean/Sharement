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

	def edit
		@user = User.find(params[:id])
		render :edit
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to root_path
		else
			redirect_to users_path
		end
	end

	def add_agreement
		user = User.find(params[:id])
		agreement = Agreement.find(params[:id])
		user.add_agreement(agreement)
		redirect_to users_path
	end

	def remove_song
		user = User.find(params[:id])
		agreement = Agreement.find(params[:agreement_id])
		user.remove_agreement(agreement)
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name, :password, :password_confirmation, :address, :city, :state, :postal_code, :phone_number)
	end
end