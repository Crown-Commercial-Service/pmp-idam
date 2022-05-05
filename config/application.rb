# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
# require "active_storage/engine"
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
# require "action_cable/engine"
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PmpIdam
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # config.web_console.whitelisted_ips = ''

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.before_configuration do
      begin
        vcap_services = JSON.parse(ENV.fetch('VCAP_SERVICES', nil))
        ENV['CCS_DEFAULT_DB_HOST'] = vcap_services['postgres'][0]['credentials']['host'].to_s
        ENV['CCS_DEFAULT_DB_PORT'] = vcap_services['postgres'][0]['credentials']['port'].to_s
        ENV['CCS_DEFAULT_DB_NAME'] = vcap_services['postgres'][0]['credentials']['name'].to_s
        ENV['CCS_DEFAULT_DB_USER'] = vcap_services['postgres'][0]['credentials']['username'].to_s
        ENV['CCS_DEFAULT_DB_PASSWORD'] = vcap_services['postgres'][0]['credentials']['password'].to_s

        allowed_domains = ['.printmarketplace.crowncommercial.gov.uk']

        vcap_application = JSON.parse(ENV.fetch('VCAP_APPLICATION', nil))

        vcap_application['application_uris'].each do |application_uri|
          allowed_domains << application_uri unless application_uri.end_with? 'crowncommercial.gov.uk'
        end

        ENV['ALLOWED_HOST_DOMAINS'] = allowed_domains.join(',').to_s
      rescue StandardError
        # Rails.logger.debug e
      end

      Rails.application.credentials.config.each do |key, value|
        next if key.to_s != ENV['SERVER_ENV_NAME'].to_s

        value.each do |env_key, env_value|
          ENV[env_key.to_s] = env_value.to_s
        end
      end

      config.exceptions_app = routes
    end
  end

  def self.google_analytics_id
    @google_analytics_id ||= ENV.fetch('GOOGLE_ANALYTICS_ID', nil)
  end
end
