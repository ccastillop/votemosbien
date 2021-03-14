class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)
    user = @user_session.authenticate
    respond_to do |format|
      if user
        user_log_in user
        format.html { redirect_back_or user, notice: "Bienvenido #{user}" }
      else
        format.html do
          flash.now[:alert] = "Email o clave no encontrados. Por favor verifica \n
            o #{helpers.link_to "Crea una cuenta", new_user_path, class: "text-blue-800" }".html_safe
          render :new, status: :unprocessable_entity      
        end
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  protected
  def user_session_params
    params.require(:user_session)
      .permit(:email, :password)
  end
end
