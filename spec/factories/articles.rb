FactoryBot.define do
  factory :article do
    title { Faker::Name.unique.name }
    img_url { Faker::Internet.unique.url }
    url { Faker::Internet.unique.url }
    column_id { nil }
    priority { Faker::Number.within(range: 1..7) }
    description { Faker::Quote.unique }
  end
end