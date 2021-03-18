class OmniauthCallbacksController < ApplicationController
  def create
    provider = params[:provider]
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      user_log_in @user
      redirect_to @user
    else
      session["omniauth.auth"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end