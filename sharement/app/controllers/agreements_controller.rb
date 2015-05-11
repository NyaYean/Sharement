class AgreementsController < ApplicationController

	def index
		@agreements = Agreements.all
		render :index

	def show
		@agreement = Agreement.find(params[:id])
		render :show
	end
	def new
		@users = Users.all
		render :new
	end

	def create
		@agreement = Agreement.new(params.permit![:Agreement])

		if @agreement.save
			redirect_to(agreement_path(@agreement))

		else
			redirect_to(new_agreement_path)

		end
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
		redirect_to(agreement_path)
	end

end