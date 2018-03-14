require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'photo.jpg'), 'image/jpeg') }
  end
  
end
