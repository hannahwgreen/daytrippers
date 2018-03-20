require 'rails_helper'

feature 'avatar' do
  scenario 'user uploads an avatar' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Display name', with: 'john stamos'
    fill_in 'Email', with: 'ash@s-mart.com'
    fill_in 'Password', with: 'boomstick!3vilisd3ad'
    fill_in 'Password confirmation', with: 'boomstick!3vilisd3ad'
    attach_file :user_avatar, "#{Rails.root}/spec/support/images/photo.jpg"
    click_button 'Sign up'

  expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
  
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