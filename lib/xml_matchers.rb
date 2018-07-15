require "nokogiri"
require "xml_matchers/version"

module XmlMatchers
  InvalidSchemaError = Class.new(StandardError)
end

RSpec::Matchers.define :match_xml_schema do |schema_content|
  def self.build_schema_for(schema_content)
    Nokogiri::XML::Schema(schema_content.to_s)
  rescue Nokogiri::XML::SyntaxError
    raise XmlMatchers::InvalidSchemaError
  end

  schema = build_schema_for(schema_content)

  match do |xml|
    document = Nokogiri::XML(xml)
    schema.valid?(document)
  end
end
