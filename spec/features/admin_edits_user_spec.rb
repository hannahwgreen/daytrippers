require 'rails_helper'

feature 'admin edits user', %Q{
  As an admin
  I want to edit a user
  So that it shows something different
} do
  let!(:user) { FactoryBot.create(:random_user) }
  let!(:admin) { FactoryBot.create(:random_admin) }

  scenario 'edit an existing user' do
    admin.confirm
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit edit_user_path(user)
    fill_in 'Display name', with: 'Joel Embiid'
    click_button 'Update'

    expect(page).to have_content('Joel Embiid')
  end
end
