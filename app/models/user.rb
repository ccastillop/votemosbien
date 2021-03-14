class User < ApplicationRecord
  PASSWORD_MIN_LEN = 6
  has_secure_password

  validates :email, presence: true,
    uniqueness: true, email: true
  validates :password,
    length: { minimum: PASSWORD_MIN_LEN },
    on: :create

  before_save do
    self.email = email.downcase
  end

  def to_s
    name || email
  end
end
