require 'rails_helper'

feature 'admin deletes trip', %Q{
  As a signed up admin
  I want to sign in
  So that I can delete a trip
} do
  let!(:admin) { FactoryBot.create(:random_admin) }
  let!(:trip1) { FactoryBot.create(:trip, name: 'Philadelphia', user: admin) }
  scenario 'visits users admin page' do
    admin.confirm
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin'

    expect(page).to have_content('Philadelphia')

    click_link("delete-trip-#{trip1.id}")

    expect(page).to have_content('Trip deleted.')
    expect(page).to have_no_content('Philadelphia')
  end
end
