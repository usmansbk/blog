require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  login_user
  background do
    FactoryBot.create :user_with_posts, name: 'Second user'
    visit root_path
  end

  context 'index page' do
    scenario 'I can see the username of all other users' do
      expect(page).to have_content 'Second user' 
    end

    scenario 'I can see the profile picture of each user' do
      pictures = page.find_all('img')
      expect(pictures.length > 0).to be true 
    end

    scenario 'I can see the number of posts each user has written' do
      expect(page).to have_content '0 Posts'
    end
  end
end
