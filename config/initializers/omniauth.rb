Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
    Rails.application.credentials.dig(:google_oauth2, :key), 
    Rails.application.credentials.dig(:google_oauth2, :secret)
  provider :facebook, 
    Rails.application.credentials.dig(:facebook_oauth2, Rails.env.to_sym, :key), 
    Rails.application.credentials.dig(:facebook_oauth2, Rails.env.to_sym, :secret)
  provider :twitter, 
    Rails.application.credentials.dig(:twitter_oauth2, :key), 
    Rails.application.credentials.dig(:twitter_oauth2, :secret)
end