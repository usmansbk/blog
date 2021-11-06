require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  login_user
  background do
    @other_user = FactoryBot.create :user, name: 'Other user'
    visit root_path
  end

  context 'index page' do
    scenario 'I can see the username of all other users' do
      expect(page).to have_content @other_user.name
    end

    scenario 'I can see the profile picture of each user' do
      expect(find('img') do |img|
               img[:src] == "https://ui-avatars.com/api/?name=#{@other_user.name}&background=random"
             end).to be_present
    end

    scenario 'I can see the number of posts each user has written' do
      expect(page).to have_content "#{@other_user.posts_counter} Post"
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      find_link(@other_user.id.to_s).click
      expect(current_path).to eq user_path(@other_user.id)
    end
  end
end
