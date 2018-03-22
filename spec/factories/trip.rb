FactoryBot.define do
  factory :trip do
    name 'New York City'
    description 'The train from Philadelphia takes you directly into the heart of Manhattan in 75 to 90 minutes, and you can tour around the city easily on any one of several hop-on hop-off sightseeing bus routes.'
    user
  end
  factory :random_trip, class: Trip do
    name { Faker::SiliconValley.company }
    description { Faker::SiliconValley.quote }
    user
  end
end
