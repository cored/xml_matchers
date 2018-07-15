require "spec_helper"

RSpec.describe XmlMatchers, "#match_xml_schema" do
  it "fails with an invalid xml schema" do
    schema = create(:schema, :invalid)

    xml = build(:response, :location)

    expect {
      expect(xml).to match_xml_schema(schema)
    }.to raise_error(XmlMatchers::InvalidSchemaError)
  end
end
