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
		agreement = Agreement.find(params[:agreement_id])
		user.add_agreement(agreement)
		redirect_to users_path
	end

	def remove_agreement
		user = User.find(params[:id])
		agreement = Agreement.find(params[:agreement_id])
		user.remove_agreement(agreement)
		redirect_to users_path
	end

	# def login
	#   	@api = PayPal::SDK::AdaptiveAccounts::API.new(
	#   :mode      => "sandbox",  # Set "live" for production
	#   :app_id    => "APP-80W284485P519543T",
	#   :username  => "jb-us-seller_api1.paypal.com",
	#   :password  => "WX4WTU3S8MY44S7F",
	#   :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy",
	#   :device_ipaddress => "127.0.0.1",
	#   :sandbox_email_address => "platform.sdk.seller@gmail.com" )

	#   	@create_account = @api.build_create_account({
	#   :accountType => "Personal",
	#   :name => {
	#     :salutation => "Mr.",
	#     :firstName => "Bonzop",
	#     :middleName => "Simore",
	#     :lastName => "Zaius" },
	#   :dateOfBirth => "1968-01-01",
	#   :address => {
	#     :line1 => "1968 Ape Way",
	#     :city => "Austin",
	#     :state => "TX",
	#     :postalCode => "78750",
	#     :countryCode => "US" },
	#   :contactPhoneNumber => "5126914160",
	#   :homePhoneNumber => "5126914160",
	#   :mobilePhoneNumber => "5126914160",
	#   :currencyCode => "USD",
	#   :citizenshipCountryCode => "US",
	#   :preferredLanguageCode => "en_US",
	#   :notificationURL => "http://localhost:3000/samples/adaptive_accounts/ipn_notify",
	#   :emailAddress => "newEmailAddress@paypal.com",
	#   :registrationType => "Web",
	#   :createAccountWebOptions => {
	#     :returnUrl => "http://localhost:3000/samples/adaptive_accounts/create_account",
	#     :showAddCreditCard => true } })
 #  end

 #  def response
 #  	@create_account_response = @api.create_account(@create_account)

 #  	if @create_account_response.success?
 #  		print @create_account_response.accountId
 #  	else
 #  		print @create_account_response.error[0].message
 #  	end
 #  end

	private
	def user_params
		params.require(:user).permit(:username, :first_name,:last_name, :password, :password_confirmation, :address, :city, :state, :postal_code, :phone_number)
	end
end