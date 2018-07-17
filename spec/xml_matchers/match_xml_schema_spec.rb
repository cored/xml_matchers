# frozen_string_literal: true

require 'spec_helper'

RSpec.describe XmlMatchers, '#match_xml_schema' do
  it 'fails with an invalid xml schema' do
    schema = create(:schema, :invalid)

    xml = build(:response, :location)

    expect do
      expect(xml).to match_xml_schema(schema)
    end.to raise_error(XmlMatchers::InvalidSchemaError)
  end
end
