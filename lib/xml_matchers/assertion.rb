require 'nokogiri'

module XmlMatchers
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
      xml_schema.valid?(xml_document)
    end

    private

    attr_reader :xml_schema
  end
end
