class UserMailer < ApplicationMailer

  def confirmation_instructions
    @user = User.find params[:id]
    mail to: @user.email
  end

  def email_changed
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def password_changed
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def reset_password_instructions
    @user = User.find_by email: params[:email]

    mail to: @user.email
  end

  def unlock_instructions
    @greeting = "Hi"

    mail to: "to@example.org"
  end

end
