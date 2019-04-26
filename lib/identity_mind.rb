require 'ostruct'
require 'httparty'
require 'identity_mind/version'
require 'identity_mind/params'
require 'identity_mind/response_error'
require 'identity_mind/entity'
require 'identity_mind/account'

module IdentityMind
  include HTTParty

  headers 'Content-Type' => 'application/json'
  format :json

  class << self
    def configuration
      @configuration ||= OpenStruct.new
    end

    def configure
      yield(configuration)
      update_config
    end

    def update_config
      base_uri configuration.base_uri
      basic_auth configuration.user, configuration.password
      true
    end

    def load_default_configuration
      @configuration = nil
      configure do |config|
        config.base_uri = 'https://edna.identitymind.com'
        config.param_length_limit = 128
      end
    end

    def perform_request(http_method, path, options, &block)
      result = super
      return result if result.success?

      raise ResponseError.new(result.body, result.code)
    end
  end

  load_default_configuration
end
