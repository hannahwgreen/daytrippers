require 'rails_helper'

feature 'avatar' do
  scenario 'user uploads an avatar' do
    user = FactoryBot.create(:user)
    user.confirm

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_css("img[src*='photo.jpg']")
  end
  scenario 'user uploads an avatar with an unsupported file type' do
    visit root_path

    click_link 'Sign Up'

    fill_in 'Display name', with: 'john stamos'
    fill_in 'Email', with: 'ash@s-mart.com'
    fill_in 'Password', with: 'boomstick!3vilisd3ad'
    fill_in 'Password confirmation', with: 'boomstick!3vilisd3ad'
    attach_file :user_avatar, "#{Rails.root}/spec/support/images/test.docx"

    click_button 'Sign up'

    expect(page).to have_content('You are not allowed to upload')
  end
end
