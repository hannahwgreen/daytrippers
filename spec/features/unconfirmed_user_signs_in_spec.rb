require 'rails_helper'

feature 'user signs in', %Q{
  As a unconfirmed signed up user
  I want to see an error
  So that I know to confirm my account
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('You have to confirm your email address before continuing.')
  end

  scenario 'specify invalid credentials' do
    user = FactoryBot.create(:user)
    user.confirm

    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    click_link 'Sign In'
    click_link "Didn't receive confirmation instructions?"

    fill_in 'Email', with: user.email

    click_button 'Resend confirmation instructions'

    expect(page).to have_content('Email was already confirmed, please try signing in')
  end

end
