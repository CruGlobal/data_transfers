source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.3"
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "mysql2"

gem "activeadmin"
gem "activemodel-serializers-xml", github: "rails/activemodel-serializers-xml"
gem "amazing_print"
gem "coffee-rails"
gem "ddtrace"
gem "dogstatsd-ruby"
gem "draper"
gem "formtastic"
gem "kaminari"
gem "lograge"
gem "oj"
gem "oj_mimic_json"
gem "omniauth-oktaoauth", github: "CruGlobal/omniauth-oktaoauth"
gem "omniauth-rails_csrf_protection", "~> 0.1"
gem "ougai", "~> 1.7"
gem "rack-cors", require: "rack/cors"
gem "ransack"
gem "rest-client"
gem "rollbar"
gem "silencer"
gem "syslog-logger"
gem "versionist"

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "dotenv-rails"
  gem "pry-rails"
  gem "rspec-rails", ">= 3.5.0.beta1"
  gem "standard"
end

group :development do
  gem "railroady"
end

group :test do
  gem "factory_bot_rails"
  gem "shoulda", require: false
  gem "simplecov", require: false
  gem "webmock"
end
