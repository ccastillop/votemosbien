source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.4'
gem 'rails', '~> 7.1'
gem 'redis', '~> 5.2'

# Use Active Storage variant
gem 'bootsnap', '>= 1.18.0', require: false
gem 'image_processing', '~> 1.2'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'aws-sdk-rails'
gem 'aws-sdk-ses'
gem 'backburner'
gem 'country_select'
gem 'exception_notification'
gem 'hotwire-rails'
gem 'jsbundling-rails', '~> 1.3'
gem 'pagy'
gem 'phonelib'
gem 'premailer-rails'
gem 'propshaft', '~> 0.9.0'
gem 'pundit'
gem 'slim-rails'
gem 'strip_attributes'
gem 'valid_email'

# authentication from scratch
gem 'active_storage_validations', '~> 1.1.4'
gem 'bcrypt'
gem 'dalli', '~> 3.2.8'
gem 'enum_help'
gem 'enum_select_rails'
gem 'hashid-rails'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-oauth', git: 'https://github.com/JamesChevalier/omniauth-oauth.git', branch: 'master'
gem 'omniauth-rails_csrf_protection' # https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
gem 'omniauth-twitter'

gem 'inline_svg'

group :development, :test do
  gem 'debug', '>= 1.0.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.2.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.9'
  gem 'rack-mini-profiler', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'hotwire-livereload', '~> 1.4'
  gem 'kamal', '~> 2.2'
  gem 'letter_opener_web', '~> 1.0'
  gem 'solargraph'
  gem 'spring'
  gem 'yard'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end
