FactoryBot.define do
  factory :user do
    display_name 'user'
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'photo.jpg'), 'image/jpeg') }
  end

  factory :admin, class: User do
    display_name 'user'
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'photo.jpg'), 'image/jpeg') }
    admin true
  end

  factory :random_user, class: User do
    display_name { Faker::Name.name }
    sequence(:email) { Faker::Internet.email }
    password 'phillyphilly'
    password_confirmation 'phillyphilly'
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'photo.jpg'), 'image/jpeg') }
  end

  factory :random_admin, class: User do
    display_name { Faker::Name.name }
    sequence(:email) { Faker::Internet.email }
    password 'phillyphilly'
    password_confirmation 'phillyphilly'
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'photo.jpg'), 'image/jpeg') }
    admin true
  end
end
