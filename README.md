# XmlMatchers

Validates XML against XSD (XML schemas)

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem "xml_matchers"
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xml_matchers

## Usage

Inspired by [json_matchers](https://github.com/thoughtbot/json_matchers)

First configure it in your test suite's helper file:

### Rspec

`spec/spec_helper`

```ruby
require "xml_matchers/rspec"
```

## Declare

Declare your XML Schema wherever you see fit for your project structure:

eg.  `spec/support/xml/schemas/locations.xsd`

## Validate

Validate an XML response or an String against an XML schema with
`match_xml_schema`:

```ruby
describe "GET /locations" do
  let(:locations_xml_schema) do
    File.read("#{File.pwd}/spec/support/xml/schemas/locations.xsd")
  end

  it "returns locations" do
    get locations_path, format: :xml

    expect(response.status).to eq 200
    expect(response.body).to match_xml_schema(locations_xml_schema)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/xml_matchers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the XmlMatchers project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/xml_matchers/blob/master/CODE_OF_CONDUCT.md).
