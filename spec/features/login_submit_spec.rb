require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background do
    visit new_user_session_path
  end
  scenario 'without filling in the email and password' do
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end
  scenario 'after filling in the username and password with incorrect data' do
    within 'form' do
      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  given(:other_user) { FactoryBot.create :user }
  scenario 'after filling in the username and password with correct data' do
    within 'form' do
      fill_in 'user_email', with: other_user.email
      fill_in 'user_password', with: other_user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
