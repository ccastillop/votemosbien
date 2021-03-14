class UserRecoverPasswordsController < ApplicationController

  def new
    @user_recover_password = UserRecoverPassword.new
  end

  def create
    @user_recover_password = UserRecoverPassword.new(recover_params)
    if @user_recover_password.valid?
      @user_recover_password.send_email
      redirect_to new_user_session_path, notice: I18n.translate('user_recover_passwords.send_instructions')
    else
      render action: :new, status: :unprocessable_entity  
    end
  end

  def edit
    @user = User.find params[:id]
    @user_new_password = UserNewPassword.new(@user)
    unless @user.recover_token == params[:token]
      redirect_to new_user_recover_password_path, alert: "El token no coincide. Intenta enviarte una nueva solicitud"
    end
  end

  def update
    @user = User.find params[:id]
    @user_new_password = UserNewPassword.new(@user, password_params)
    if @user.recover_token == params[:token] && @user_new_password.save
      user_log_in @user
      redirect_to @user, notice: "He cambiado tu contraseña e iniciaste sesión. \n Bienvenido de vuelta #{@user}."
    else
      render action: :edit, status: :unprocessable_entity  
    end
  end

  protected
    def recover_params
      params.require(:user_recover_password).permit(:email)
    end

    def password_params
      params.require(:user_new_password).permit(:password, :password_confirmation)
    end

end
