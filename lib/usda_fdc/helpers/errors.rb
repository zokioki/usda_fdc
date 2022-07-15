# frozen_string_literal: true

module UsdaFdc
  class ArgumentError < ::ArgumentError
  end

  class ResponseError < StandardError
    attr_reader :code

    def initialize(message = '', code = nil)
      @code = code
      super(message)
    end
  end

  # For 4xx responses
  class ClientError < ResponseError
  end

  # For 5xx responses
  class ServerError < ResponseError
  end
end
