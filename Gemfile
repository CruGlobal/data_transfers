source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem 'mysql2'
gem 'newrelic_rpm'
gem 'versionist'
gem 'rack-cors', require: 'rack/cors'
gem 'redis-rails'
gem 'rollbar'
gem 'silencer'
gem 'syslog-logger'
gem 'oj'
gem 'oj_mimic_json'
group :development, :test do
  gem 'dotenv-rails'
  # gem 'guard-rubocop'
  # gem 'guard-rspec'
  gem 'rspec-rails', '>= 3.5.0.beta1'
  gem 'pry-rails'
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'railroady'
end

group :test do
  gem 'webmock'
  gem 'simplecov', require: false
  gem 'factory_girl_rails'
  gem 'shoulda', require: false
  gem 'rubocop'
end

# gem 'omniauth', '~> 1.3.1'
gem 'omniauth-cas', github: '4teamwork/omniauth-cas', branch: 'rails5'
gem 'ransack',    github: 'activerecord-hackery/ransack'
gem 'kaminari',   github: 'amatsuda/kaminari', branch: '0-17-stable'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'draper',     github: 'audionerd/draper', branch: 'rails5'
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
gem 'activeadmin', github: 'activeadmin', ref: 'e558e8c08e8c5d625a2d01369bfe2704cecdc296'
gem 'turbolinks'
gem 'quiet_assets'
gem 'rest-client'
gem 'ddtrace'
gem 'dogstatsd-ruby'
