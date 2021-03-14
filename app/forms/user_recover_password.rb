class UserRecoverPassword
  include ActiveModel::Model

  attr_accessor :email
  validates :email, presence: true, email: true

  validate :email_exists
  def email_exists
    unless User.exists?(email: email&.downcase)
      errors.add(:email, "No encontramos este email. ¿Estás registrado?")
    end
  end

  def send_email
    user = User.find_by email: email
    unless user.valid?
      user.password = user.password_confirmation = SecureRandom.alphanumeric(User::PASSWORD_MIN_LEN)
      user.save
    end
    user.regenerate_recover_token
    UserMailer.with(email: email).reset_password_instructions.deliver_later
  end

end