Rails.application.routes.draw do
  resources :candidates do
    resource :answer
  end
  resources :regions
  resources :elections
  resources :parties do
    resource :answer
  end
  resources :questions do
    resources :options, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #https://hackernoon.com/building-a-simple-session-based-authentication-using-ruby-on-rails-9tah3y4j
  resources :users
  resources :user_sessions, only: %i(new create destroy)
  get '/auth/:provider/callback', to: 'omniauth_callbacks#create', as: :omniauth_callback

  resources :user_recover_passwords, only: %i(new create edit update)
  resources :user_confirmations, only: %i(new create show)
  
  resource :answer
  resources :attachments, only: %i(destroy)
  resource :map, only: %i[show]

  get "/:page", to: "home#show", as: :home
  root 'maps#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
