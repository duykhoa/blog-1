FactoryGirl.define do
  factory :article do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraph(5)
    published true
    published_at Time.current
    thumbnail File.new("#{Rails.root}/spec/support/fixtures/thumbnail.jpg")
    tag_list Faker::Lorem.words(10).join(', ')
    association :category
  end
end
