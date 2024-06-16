source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 6.4'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 5.2'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.18.0', require: false

group :development, :test do
  gem 'debug', ">= 1.0.0" 
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.2.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 3.3'
  gem 'listen', '~> 3.9'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'letter_opener_web', '~> 1.0'
  gem 'yard'
  gem 'solargraph'
  gem "hotwire-livereload", "~> 1.4"
  gem "kamal", "~> 1.6"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

## added gems start here ##
gem 'exception_notification'
gem 'pagy'
gem 'valid_email'
gem 'pundit'
gem 'country_select'
gem 'phonelib'
gem "strip_attributes"
gem "backburner"
gem 'aws-sdk-rails'
gem 'aws-sdk-ses'
gem 'slim-rails'
gem "propshaft", "~> 0.9.0"
gem "jsbundling-rails", "~> 1.3"
gem 'hotwire-rails'
gem 'inline_svg'
#add stylesheet in mailer layout
gem 'premailer-rails'

#authentication from scratch
gem 'bcrypt'
gem 'omniauth-oauth', git: 'git@github.com:JamesChevalier/omniauth-oauth.git', branch: 'master'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection' #https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
gem 'omniauth-twitter'
gem 'enum_help'
gem 'enum_select_rails'
gem "hashid-rails"
gem "active_storage_validations", "~> 1.1.4"
gem "dalli", "~> 3.2.8"


