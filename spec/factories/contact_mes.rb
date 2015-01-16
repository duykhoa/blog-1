FactoryGirl.define do
  factory :contact_me do
    name Faker::Name.name
    email Faker::Internet.email
    content Faker::Lorem.paragraph(3)
  end
end
