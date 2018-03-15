require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to cancel my account
  So that I don't exist on the website
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)
    user.confirm
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link('edit-profile')
    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.') 
    
    click_link 'Sign In'    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password    
    click_button 'Log in'
    
    expect(page).to have_content('Invalid Email or password.')
  end
end
