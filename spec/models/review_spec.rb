require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should have_valid(:rating).when('3', '4') }
  it { should_not have_valid(:rating).when(nil, '') }

  it { should have_valid(:body).when('Blah blah blah blah blah') }
end
