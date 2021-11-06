require 'rails_helper'

RSpec.feature "Users", type: :feature do
  login_user

  context '#index' do
    scenario 'I can see the username of all other users' do
      FactoryBot.create :user_with_posts, name: "Second user"
      visit root_path
      expect(page).to have_content "Second user"
    end
  end
end
