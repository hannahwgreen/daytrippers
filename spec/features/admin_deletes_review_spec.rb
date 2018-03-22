require 'rails_helper'

feature 'admin deletes review', %Q{
  As a signed up admin
  I want to sign in
  So that I can delete a review
} do
  let!(:user) { FactoryBot.create(:random_user) }
  let!(:admin) { FactoryBot.create(:random_admin) }
  let!(:trip1) { FactoryBot.create(:random_trip, user: admin) }
  let!(:trip2) { FactoryBot.create(:random_trip, name: 'Atlantic City', user: admin) }
  let!(:review) { FactoryBot.create(:random_review, user: user, trip: trip1) }
  scenario 'visits users admin page' do
    admin.confirm
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin'

    expect(page).to have_content(review.body)

    click_link("delete-review-#{review.id}")

    expect(page).to have_content('Review deleted.')
    expect(page).to have_no_content(review.body)
  end
end
