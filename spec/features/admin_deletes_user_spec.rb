require 'rails_helper'

feature 'admin deletes user', %Q{
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

    expect(page).to have_content('Admin Dashboard')
  end

  scenario 'deletes user' do
    user = FactoryBot.create(:user)
    user.confirm
    admin = FactoryBot.create(:admin)
    admin.confirm
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin'

    expect(page).to have_content('Admin Dashboard')

    first('.list-unstyled').first('li').click_link('Delete')

    expect(page).to have_content('User account deleted.')
  end
end
