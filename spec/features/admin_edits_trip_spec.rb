require 'rails_helper'

feature 'admin edits', %Q{
  As an admin
  I want to edit a trip
  So that it shows something different
} do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin) { FactoryBot.create(:admin) }
  let!(:trip1) { FactoryBot.create(:trip, user: admin) }
  let!(:trip2) { FactoryBot.create(:trip, name: 'Atlantic City', user: admin) }
  
  scenario 'edit an existing trip' do
    admin.confirm
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    visit edit_trip_path(trip2)

    fill_in 'Name', with: 'Ocean City'
    click_button 'Update'

    expect(page).to have_content('Ocean City')
  end  
end
