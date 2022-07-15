# frozen_string_literal: true

require 'net/http'
require 'json'
require_relative 'helpers/errors'

module UsdaFdc
  class Client
    API_URL = 'https://api.nal.usda.gov'

    def initialize(api_key = nil)
      @api_key = api_key || UsdaFdc.api_key
      raise UsdaFdc::ArgumentError, 'An API key is required.' if @api_key.nil?
    end

    def food(fdc_id, params = {}, &block)
      get("/fdc/v1/food/#{fdc_id}", params, &block)
    end

    def foods(body = {}, &block)
      post('/fdc/v1/foods', body, &block)
    end

    def foods_list(body = {}, &block)
      post('/fdc/v1/foods/list', body, &block)
    end

    def foods_search(body = {}, &block)
      post('/fdc/v1/foods/search', body, &block)
    end

    def get(path, params = {})
      uri = URI("#{API_URL}#{path}")
      uri.query = URI.encode_www_form(params) if params.any?

      request = Net::HTTP::Get.new(uri)
      assign_default_headers(request)

      yield(request) if block_given?

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      handle_response(response)
    end

    def post(path, body = {})
      uri = URI("#{API_URL}#{path}")

      request = Net::HTTP::Post.new(uri)
      assign_default_headers(request)
      request.body = body.to_json

      yield(request) if block_given?

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      handle_response(response)
    end

    private

    def assign_default_headers(request)
      request['X-Api-Key'] = @api_key
      request['Content-Type'] = 'application/json'
      request['User-Agent'] = "usda_fdc gem (v#{UsdaFdc::VERSION})"
    end

    def handle_response(response)
      case response
      when Net::HTTPSuccess
        JSON.parse(response.body)
      when Net::HTTPClientError
        raise UsdaFdc::ClientError.new(response.message, response.code)
      when Net::HTTPServerError
        raise UsdaFdc::ServerError.new(response.message, response.code)
      else
        response
      end
    end
  end
end
