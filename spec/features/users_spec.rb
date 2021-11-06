require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  login_user
  background do
    @user1 = FactoryBot.create :user, name: 'Other user'
    @user2 = FactoryBot.create :user_with_posts, name: 'Second user'
    visit root_path
  end

  context 'index page' do
    scenario 'I can see the username of all other users' do
      expect(page).to have_content @user1.name
      expect(page).to have_content @user2.name
    end

    scenario 'I can see the profile picture of each user' do
      picture1 = find('img') { |img| img[:src] == "https://ui-avatars.com/api/?name=#{@user1.name}&background=random" }
      picture2 = find('img') { |img| img[:src] == "https://ui-avatars.com/api/?name=#{@user2.name}&background=random" }
      expect(picture1).to be_present
      expect(picture2).to be_present
    end

    scenario 'I can see the number of posts each user has written' do
      expect(page).to have_content '0 Posts'
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      within '.columns' do
        find_link(href: user_path(@user1.id)).click
      end
      expect(current_path).to eq user_path(@user1.id)
    end
  end
end
