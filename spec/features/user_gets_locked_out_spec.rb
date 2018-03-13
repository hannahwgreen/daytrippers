require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to lock my account
  So that I can be protected
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)
    user.confirm

    visit new_user_session_path

    5.times do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'wrongpassword'

      click_button 'Log in'
    end

    expect(page).to have_content('Your account is locked.')
  end
end
