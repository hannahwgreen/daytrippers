require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_valid(:name).when('name') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:description).when('Oh my gosh this trip is so cool') }
  it { should_not have_valid(:description).when(nil, '') }

  it { should have_valid(:image_url).when('https://www.imgur.com/puppies.jpg') }
end
