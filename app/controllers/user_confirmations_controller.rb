class UserConfirmationsController < ApplicationController
  def show
    @user = User.find params[:id]
    if params[:token] == @user.recover_token
      @user.touch :email_confirmed_at
      user_log_in @user
      redirect_to @user, notice: "Tu email ha sido confirmado y has iniciado sesión. \n Bienvenido #{@user}"
    else
      log_out @user
      render :new, status: :unprocessable_entity  
    end
  end

  def new
    @user_confirmation = UserConfirmation.new
  end

  def create
    @user_confirmation = UserConfirmation.new(user_confirmation_params)
    if @user_confirmation.valid?
      @user_confirmation.send!
      redirect_to home_path(page: "after_resending_confirmation"),
        notice: "Reenvié la confirmación. Por favor revisa tu bandeja de email"
    else
      render :new, status: :unprocessable_entity  
    end
  end

  protected
    def user_confirmation_params
      params.require(:user_confirmation_params).permit(:email)
    end

end