
FactoryBot.define do
  factory :response, class: FakeResponse do
    trait :location do
      body { File.read("#{Dir.pwd}/spec/support/responses/location.xml") }
    end
  end

  factory :schema, class: FakeSchema do
    skip_create
    sequence(:name) { |n| "xml_schema-#{n}" }

    trait :invalid do
      xml { "" }
    end
  end
end
