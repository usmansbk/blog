require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background do
    visit new_user_session_path
  end

  scenario 'I see the email and password inputs and the "Submit" button' do
    expect(page.has_field?('user_email')).to be true
    expect(page.has_field?('user_password')).to be true
    expect(page.has_button?('Log in')).to be true
  end
end
