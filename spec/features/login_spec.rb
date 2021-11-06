require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  before :each do
    visit new_user_session_path
  end

  context 'visit page' do
    scenario 'should display form elements' do
      within 'form' do
        page.has_field? 'email'
        page.has_field? 'password'
        page.has_button? 'Submit'
      end
    end
  end
end
