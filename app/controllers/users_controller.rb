class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @pagy, @users = pagy(policy_scope(User))
  end

  # register new user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.with(id: @user.id).confirmation_instructions.deliver_later
        format.html { redirect_to root_path, notice: "Enviamos un email de confirmación a tu bandeja de correo electrónico." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Usuario actualizado" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User ha sido destruido." }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, 
        :first_name, :last_name, :phone, :country_code,
        :password, :password_confirmation,
        :company_name, :company_tax_id
      )
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
