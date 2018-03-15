require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_valid(:name).when('Featured') }
  it { should_not have_valid(:name).when(nil, '') }
end
