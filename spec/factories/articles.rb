FactoryGirl.define do
  factory :article do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraphs(5)
    published true
    association :category
  end
end
