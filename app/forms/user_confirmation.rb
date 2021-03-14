class UserConfirmation
  include ActiveModel::Model

  attr_accessor :email, :user

  validates :email, presence: true, email: true
  validate do
    @user = User.find_by(email: email&.downcase)
    unless @user
      error.add(:email, "No encontramos al usuario con este email")
    end
  end

  def send!
    user.regenerate_recover_token
    UserMailer.with(id: user.id).confirmation_instructions.deliver_later
  end

end