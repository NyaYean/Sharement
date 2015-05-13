class AgreementsController < ApplicationController

	def index
		@agreements = Agreement.all
		render :index
	end
	def show
		@agreement = Agreement.find(params[:id])
		render :show
	end
	def new
		@agreement = Agreement.new
		@users = User.all
	end

	def create
		@agreement = Agreement.new(params.permit![:agreement])
		@agreement.users.push(current_user)
		if @agreement.save
			redirect_to root_path

		else
			redirect_to(new_agreement_path)

		end
	end


	def edit 
		@agreement = Agreement.find(params[:id])
	end

	def update
		@agreement = Agreement.find(params[:id])
		if @agreement.update(params.permit![:agreement])
			redirect_to(agreement_path(@agreement))
		else
			redirect_to(edit)
		end
	end

	def destroy
		@agreement = Agreement.find(params[:id])
		@agreement.destroy
		redirect_to root_path
	end

end