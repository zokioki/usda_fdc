# frozen_string_literal: true

require_relative 'lib/usda_fdc/version'

Gem::Specification.new do |spec|
  spec.name = 'usda_fdc'
  spec.version = UsdaFdc::VERSION
  spec.authors = ['Zoran Pesic']
  spec.email = ['zspesic@gmail.com']

  spec.summary = 'A Ruby interface to the USDA FoodData Central API.'
  spec.homepage = 'https://github.com/zokioki/usda_fdc'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
