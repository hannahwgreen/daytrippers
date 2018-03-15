require 'rails_helper'

RSpec.describe TripCategorization, type: :model do
  it { should have_valid(:trip_id).when(1) }
  it { should_not have_valid(:trip_id).when(nil, '') }

  it { should have_valid(:category_id).when(1) }
  it { should_not have_valid(:category_id).when(nil, '') }
end
