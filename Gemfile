# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.7', '>= 6.1.7.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.6'
# Use Puma as the app server
gem 'puma', '~> 6.3', '>= 6.3.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4', '>= 5.4.4'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11', '>= 2.11.5'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# for cognito
gem 'aws-sdk-cognitoidentityprovider', '~> 1.73.0'
# importing creds
gem 'aws-sdk-s3', '~> 1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# For scheduling tasks
gem 'arask', '1.2.4'

# for postgresql
gem 'activerecord-postgis-adapter', '~> 8.0.0'
gem 'pg', '~> 1.5.3'
# remove if not option two taken in project
gem 'jwt'
gem 'rest-client', '~> 2.1'
gem 'rollbar'
gem 'roo', '~> 2.10.0'
# remove if not option two taken in project

# For canonical urls
gem 'canonical-rails', github: 'jumph4x/canonical-rails'

# For environment variables
gem 'aws-sdk-ssm'

# Add rate limiting on the API
gem 'rack-attack'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '>= 2.8.1'
  gem 'i18n-tasks', '>= 1.0.12'
  gem 'rspec-rails', '>= 6.0.2'
  gem 'rubocop', '>= 0.91.1'
  gem 'rubocop-performance', '>= 1.8.1'
  gem 'rubocop-rails', '>= 2.20.0'
  gem 'rubocop-rspec', '>= 1.43.2' # or gem 'rubocop-minitest'
  gem 'brakeman'
  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.8'
  gem 'web-console', '>= 4.2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.1.0'
end

group :test do
  gem 'rails-controller-testing', '>= 1.0.5'
  gem 'simplecov', '>= 0.16.1', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
