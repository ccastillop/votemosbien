json.extract! user, :id, :name, :email, :password_digest, :recover_token, :email_confirmed_at, :created_at, :updated_at
json.url user_url(user, format: :json)
