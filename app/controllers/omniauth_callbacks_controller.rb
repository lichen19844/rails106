class OmniauthCallbacksController < ApplicationController

	def google_oauth2
		@user = User.from_google(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
			sign_in_and_redirect @user, :event => :authentication
		else
			session["devise.user_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_path
		end
	end

	def facebook
		@user = User.from_facebook(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
			sign_in_and_redirect @user, :event => :authentication
		else
			session["devise.user_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_path
		end
	end

	def github
		@user = User.from_github(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Github"
			sign_in_and_redirect @user, :event => :authentication
		else
			session["devise.user_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end

#wechat is unable
  	def wechat
    	@user = User.from_omniauth(request.env["omniauth.auth"])
    	if @user.persisted?
      		sign_in_and_redirect @user, :event => :authentication
    	else
      		session["devise.wechat_data"] = request.env["omniauth.auth"]
      		redirect_to new_user_registration_url
    	end
  	end	

end
