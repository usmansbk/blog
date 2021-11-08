require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario 'Page has a login form' do
    expect(page.has_field?('user_email')).to be true
    expect(page.has_field?('user_password')).to be true
    expect(page.has_button?('Log in')).to be true
  end

  context 'Submit' do
    scenario 'without email and password' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    scenario 'with incorrect email and password' do
      within 'form' do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    given(:other_user) { FactoryBot.create :user }
    scenario 'with correct email and password' do
      within 'form' do
        fill_in 'user_email', with: other_user.email
        fill_in 'user_password', with: other_user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end
end
