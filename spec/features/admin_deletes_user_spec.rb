require 'rails_helper'

feature 'admin signs in', %Q{
  As a signed up admin
  I want to sign in
  So that I can delete a user
} do
  scenario 'visits users admin page' do
    user = FactoryBot.create(:admin)
    user.confirm

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    
    click_link 'Admin'

    expect(page).to have_content('Users Page:')
  end

  scenario 'deletes user' do
    user = FactoryBot.create(:admin)
    user.confirm

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    
    click_link 'Admin'

    expect(page).to have_content('Users Page:')

    click_link('Delete')
    
    expect(page).to have_content('User account deleted')
  end
end
