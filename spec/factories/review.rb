FactoryBot.define do
  factory :review do
    body 'It was a great trip.'
    rating 3
    trip
    user
  end
  
  factory :random_review, class: Review do
    body { Faker::Seinfeld.quote }
    rating 3
    trip
    user
  end
end
