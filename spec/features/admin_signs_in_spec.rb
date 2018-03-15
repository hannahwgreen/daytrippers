require 'rails_helper'

feature 'admin signs in', %Q{
  As a signed up admin
  I want to sign in
  So that I can gain access to admin functionality
} do
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:admin)
    user.confirm

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Admin')
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
  end

  scenario 'credentials not for an admin' do
    user = FactoryBot.create(:user)
    user.confirm

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_no_content('Admin')
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
  end
end
