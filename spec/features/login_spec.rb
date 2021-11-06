require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  before :each do
    visit new_user_session_path
  end

  context 'visit page' do
    scenario 'I see the email and password inputs and the "Submit" button' do
      expect(page.has_field?('user_email')).to be true
      expect(page.has_field?('user_password')).to be true
      expect(page.has_button?('Log in')).to be true
    end
  end

  context 'Failure' do
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
  end

  context 'Success' do
    scenario 'after filling in the username and password with correct data' do
      FactoryBot.create :user, email: 'user@example.com', password: 'password', password_confirmation: 'password'
      within 'form' do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end
end
