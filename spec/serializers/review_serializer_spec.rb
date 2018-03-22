require 'rails_helper'

RSpec.describe ReviewSerializer, type: :serializer do
  let!(:user) { FactoryBot.create(:random_user) }
  let!(:admin) { FactoryBot.create(:random_admin) }
  let!(:trip1) { FactoryBot.create(:random_trip, user: admin) }
  let!(:trip2) { FactoryBot.create(:random_trip, name: 'Atlantic City', user: admin) }
  let!(:review) { FactoryBot.create(:random_review, user: user, trip: trip1) }
  let(:serializer) { described_class.new(review) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  let(:subject) { JSON.parse(serialization.to_json) }

  it 'has an id that matches' do
    expect(subject['review']['id']).to eql(review.id)
  end

  it 'has a name that matches' do
    expect(subject['review']['body']).to eql(review.body)
  end  
end
