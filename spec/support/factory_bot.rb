require 'factory_bot'

FactoryBot.define do
  factory :user do
    display_name 'user'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'photo.jpg'), 'image/jpeg') }
  end
  factory :admin, class: User do
    display_name 'user'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'photo.jpg'), 'image/jpeg') }
    admin true
  end
end
