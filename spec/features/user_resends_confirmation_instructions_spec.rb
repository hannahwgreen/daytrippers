require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to resend my confirmation email
  So that I can confirm my account
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)

    visit new_user_registration_path
    
    fill_in 'Display name', with: 'john stamos'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    click_link 'Sign In'
    click_link "Didn't receive confirmation instructions?"

    fill_in 'Email', with: user.email

    click_button 'Resend confirmation instructions'

    expect(page).to have_content('You will receive an email with instructions for how to confirm your email address in a few minutes.')
  end

end
