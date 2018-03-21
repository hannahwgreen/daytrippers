require 'rails_helper'

feature 'user searches', %Q{
  As a user
  I want to use the search
  So I can find a specific trip
} do
  let!(:user) { FactoryBot.create(:user) }
  let!(:trip) { FactoryBot.create(:trip, user: user) }
  scenario 'search for existing trip' do

    visit root_path
    fill_in 'search_keywords', with: 'New York'
    click_button 'Search'

    expect(page).to have_content('New York City')
    expect(page).to have_content('The train from Philadelphia takes you directly into the heart of Manhattan in 75 to 90 minutes, and you can tour around the city easily on any one of several hop-on hop-off sightseeing bus routes.')
  end
  scenario 'search with blank field' do
    visit root_path
    click_button 'Search'

    expect(page).to have_content('The seach field cannot be blank.')
  end
  scenario 'search for nonexistent trip' do
    user = FactoryBot.create(:user)
    user.confirm
    visit root_path
    fill_in 'search_keywords', with: 'Test'
    click_button 'Search'

    expect(page).to have_content('No results found.')
  end
end
