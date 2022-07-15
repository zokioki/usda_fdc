# UsdaFdc

A Ruby interface to the USDA [FoodData Central](https://fdc.nal.usda.gov) API.

## Installation

To install the latest release:

    $ gem install usda_fdc

To include in a Rails project, add it to the Gemfile:

```ruby
gem 'usda_fdc'
```

## Usage

An API key is required to access the service. You can find details on how to obtain a key [here](https://fdc.nal.usda.gov/api-guide.html#bkmk-3).

Once you have an API key, you're able to make API calls via the client object:

```ruby
client = UsdaFdc::Client.new('your_api_key')
client.food(534358)

#=> { "dataType" => "Branded", "description" => "NUT 'N BERRY MIX", "fdcId" => 534358, ... }
```

You can also configure the default API key globally for all `UsdaFdc::Client` instances:

```ruby
UsdaFdc.configure do |config|
  config.api_key = 'your_api_key'
end
```

For more information on interacting with the API, including accepted parameters and response formats, check out the official USDA FDC [API guide](https://fdc.nal.usda.gov/api-guide.html).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
