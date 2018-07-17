# frozen_string_literal: true

require 'nokogiri'
require 'xml_matchers/assertion'
require 'xml_matchers/version'

module XmlMatchers
  InvalidSchemaError = Class.new(StandardError)
end

RSpec::Matchers.define :match_xml_schema do |schema_content|
  assertion = XmlMatchers::Assertion.for(schema_content)

  match do |xml|
    assertion.valid?(xml)
  end
end
