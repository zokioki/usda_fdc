# frozen_string_literal: true

require_relative 'helpers/configurable'

module UsdaFdc
  extend Configurable

  define_setting :api_key
end
