require "nokogiri"
require "xml_matchers/version"

module XmlMatchers
  InvalidSchemaError = Class.new(StandardError)

  class Assertion
    def self.for(schema_content)
      new(xml_schema: Nokogiri::XML::Schema(schema_content.to_s))
    rescue Nokogiri::XML::SyntaxError
      raise InvalidSchemaError
    end

    def initialize(xml_schema:)
      @xml_schema = xml_schema
    end

    def valid?(xml_content)
      xml_document = Nokogiri::XML(xml_content)
      xml_schema.valid?(xml_documet)
    end

    private

    attr_reader :xml_schema
  end
end

RSpec::Matchers.define :match_xml_schema do |schema_content|
  assertion = XmlMatchers::Assertion.for(schema_content)

  match do |xml|
    assertion.valid?(xml)
  end
end
