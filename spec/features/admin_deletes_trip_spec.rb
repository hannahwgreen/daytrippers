require 'rails_helper'

feature 'user searches', %Q{
  As an admin
  I want to delete a trip
  So that it no longer shows up
} do
  let!(:admin) { FactoryBot.create(:admin) }
  let!(:trip1) { FactoryBot.create(:trip, user: admin) }
  let!(:trip2) { FactoryBot.create(:trip, name: 'Atlantic City', user: admin) }
  
  scenario 'delete an existing trip' do
    admin.confirm
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin'
    
    expect(page).to have_content('Atlantic City')
    
    first('.list-unstyled').first('li').click_link('Delete')
    
    expect(page).to have_no_content('Atlantic City')
  end  
end
