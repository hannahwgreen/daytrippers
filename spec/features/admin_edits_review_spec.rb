require 'rails_helper'

feature 'admin edits', %Q{
  As an admin
  I want to edit a review
  So that it shows something different
} do
  let!(:user) { FactoryBot.create(:random_user) }
  let!(:admin) { FactoryBot.create(:random_admin) }
  let!(:trip1) { FactoryBot.create(:trip, user: admin) }
  let!(:trip2) { FactoryBot.create(:trip, name: 'Atlantic City', user: admin) }
  let!(:review) { FactoryBot.create(:random_review, user: user, trip: trip1) }

  scenario 'edit an existing review' do
    admin.confirm
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    visit edit_review_path(review)

    fill_in 'Body', with: 'It was OK.'

    click_button 'Update'

    expect(page).to have_content('It was OK.')
  end

  scenario 'try to edit a review without being an admin' do
    user.confirm
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit edit_review_path(review)

    expect(page).to have_content('You need permission to see this page.')
  end
end
