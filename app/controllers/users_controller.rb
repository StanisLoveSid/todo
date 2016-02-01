class UsersController < ApplicationController
	before_filter :set_locale
    

	def registration
		
	end

	def create
      @user = User.create( user_params )
    end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

   def user_params
      params.require(:user).permit(:avatar)
   end

	private
	def locale
		I18n.locale = params[:locale] if params[:locale].present?
		# current_user.locale
		# request.subdomain
		# request.env["HTTP_ACCEPT_LANGUAGE"]
		# request.remote_ip
	end


end
