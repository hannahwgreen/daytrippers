require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to reset my password
  So that I can access my account
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)
    user.confirm

    visit new_user_registration_path
    fill_in 'Display name', with: 'john stamos'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    click_link 'Sign In'
    click_link 'Forgot your password?'

    fill_in 'Email', with: user.email

    click_button 'Send me reset password instructions'

    expect(page).to have_content('You will receive an email with instructions on how to reset your password in a few minutes.')
  end

end
