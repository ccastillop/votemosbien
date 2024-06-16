class User < ApplicationRecord
  PASSWORD_MIN_LEN = 6
  has_secure_password
  has_one_attached :auth_photo
  has_many :candidates
  has_many :parties

  validates :auth_photo,
    content_type: [:png, :jpg, :jpeg],
    size: { less_than: 20.megabytes }

  validates :email, presence: true,
    uniqueness: true, email: true

  validates :password,
    length: { minimum: PASSWORD_MIN_LEN },
    on: :create
  
  validates :first_name, :last_name,
    presence: true, on: :update

  enum level: {
    admin: "admin",
    candidate: "candidate",
    no_access: "no_access"
  }

  before_save do
    self.email = email.downcase
  end

  def to_s
    [first_name, last_name].join(" ") || email
  end
  
  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email # && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          first_name: ( auth.extra.raw_info.given_name || auth.extra.raw_info.name.split(" ").first || "-falta nombre-" ),
          last_name: ( auth.extra.raw_info.family_name || auth.extra.raw_info.name.split(" ")[1..-1].join(" ") || "-falta apellido-" ) ,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: SecureRandom.alphanumeric(12)
        )
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

end
