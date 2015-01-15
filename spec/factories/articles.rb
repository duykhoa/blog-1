FactoryGirl.define do
  factory :article do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraph(5)
    published true
    published_at Time.current
    thumbnail File.new("#{Rails.root}/spec/support/fixtures/thumbnail.jpg")
    association :category
  end
end
