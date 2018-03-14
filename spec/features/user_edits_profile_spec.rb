require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to edit my profile
  So that I can change my display name
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)
    user.confirm

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link('edit-profile')
      
    fill_in 'Display name', with: 'bob saget'
    fill_in 'Password confirmation', with: 'password'
    
    click_button 'Update'
    
    expect(page).to have_content('bob saget')    
  end

  scenario 'specify invalid name' do
    user = FactoryBot.create(:user)
    user.confirm

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link('edit-profile')
      
    fill_in 'Display name', with: ''
    fill_in 'Password confirmation', with: 'password'
    
    click_button 'Update'
    
    expect(page).to have_content("Display name can't be blank")
  end
end
