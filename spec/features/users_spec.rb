require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  login_user
  given(:other_user) { FactoryBot.create :user_with_posts }
  background do
    FactoryBot.create :user_with_posts, name: 'Second user'
    visit root_path
  end

  context 'index page' do
    scenario 'I can see the username of all other users' do
      expect(page).to have_content 'Second user'
    end

    scenario 'I can see the profile picture of each user' do
      picture = find('img') { |img| img[:src] == 'https://ui-avatars.com/api/?name=Second user&background=random' }
      expect(picture).to be_present
    end

    scenario 'I can see the number of posts each user has written' do
      expect(page).to have_content '0 Posts'
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      within '.columns' do
        find_link(href: user_path(@user.id)).click
      end
      expect(current_path).to eq user_path(@user.id)
    end
  end
end
