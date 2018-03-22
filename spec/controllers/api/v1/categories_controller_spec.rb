require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe Api::V1::CategoriesController, type: :controller do
  let!(:c1) { Category.create( name: 'Beaches') }
  let!(:c2) { Category.create( name: 'Family') }

  describe 'GET#index' do
    it 'should return a list of all categories' do
      get :index
      returned_json = JSON.parse(response.body)
      
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json[0]['name']).to eq 'Beaches'
    end
  end
end
