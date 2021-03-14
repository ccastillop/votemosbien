class UserNewPassword
  include ActiveModel::Model

  attr_accessor :password, :password_confirmation, :user
  validates :password, :password_confirmation, presence: true
  validates :password, length: { minimum: User::PASSWORD_MIN_LEN }

  def initialize(user, params={})
    @user = user
    @user.attributes = params
    super(params)
  end

  def save
    ActiveRecord::Base.transaction do
      begin
        # Valid will setup the Form object errors
        if valid?
          user.save!
          user.regenerate_recover_token
          true
        else
          false
        end
      rescue => e
        self.errors.add(:base, e.message)
        false
      end
    end
  end

end