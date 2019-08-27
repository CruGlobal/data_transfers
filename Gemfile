source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.3.8"

gem "rails", "~> 5.2.3"
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem "puma", "~> 3.11"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem "mysql2"
gem "newrelic_rpm"
gem "versionist"
gem "rack-cors", require: "rack/cors"
gem "redis-rails"
gem "rollbar"
gem "silencer"
gem "syslog-logger"
gem "oj"
gem "oj_mimic_json"

group :development, :test do
  gem "bundler-audit"
  gem "brakeman"
  gem "dotenv-rails"
  gem "rspec-rails", ">= 3.5.0.beta1"
  gem "pry-rails"
  gem "standard"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "railroady"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"

  gem "webmock"
  gem "simplecov", require: false
  gem "factory_girl_rails"
  gem "shoulda", require: false
  gem "rubocop"
end

gem "omniauth-cas", github: "4teamwork/omniauth-cas", branch: "rails5"
gem "ransack"
gem "kaminari"
gem "formtastic", github: "justinfrench/formtastic"
gem "draper"
gem "activemodel-serializers-xml", github: "rails/activemodel-serializers-xml"
gem "activeadmin"
gem "rest-client"
gem "ddtrace"
gem "dogstatsd-ruby"
gem "awesome_print"
gem "lograge"
gem "ougai", "~> 1.7"
