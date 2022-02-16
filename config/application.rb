require_relative "boot"

require "rails/all"
require_relative "../lib/log/logger"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DataTransfers
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.assets.enabled = false
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.view_specs false
      g.helper_specs false
      g.template_engine false
      g.stylesheets false
      g.javascripts false
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "*",
          headers: :any,
          methods: [:get, :post, :delete, :put, :patch, :options, :head],
          max_age: 0
      end
    end

    # Enable ougai
    if Rails.env.development? || Rails.const_defined?("Console")
      config.logger = Log::Logger.new(STDOUT)
    elsif !Rails.env.test? # use default logger in test env
      config.logger = Log::Logger.new(Rails.root.join("log", "datadog.log"))
    end
  end
end
