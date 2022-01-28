# frozen_string_literal: true

require_relative 'usda_fdc/version'
require_relative 'usda_fdc/configuration'

module UsdaFdc
  extend Configuration

  define_setting :api_key
end
