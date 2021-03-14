class UserSession
  include ActiveModel::Model

  attr_accessor :email, :password 

  validates :email, presence: true, email: true
  validates :password, presence: true

  def authenticate
    user = User.find_by(email: email&.downcase)
    if user && user.authenticate(password)
      user
    else
      errors.add(:email, " / clave no encontrados. Por favor verifica o crea una cuenta")
      false
    end
  end

end