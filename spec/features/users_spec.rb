require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  login_user
  background do
    @users = FactoryBot.create_list :user, 3
    visit root_path
  end

  context 'index page' do
    scenario 'I can see the username of all other users' do
      @users.each do |user|
        expect(page).to have_content user.name
      end
    end

    scenario 'I can see the profile picture of each user' do
      within '.columns' do
        @users.each do |user|
          expect(find('img') do |img|
                   img[:src] == "https://ui-avatars.com/api/?name=#{user.name}&background=random"
                 end).to be_present
        end
      end
    end

    scenario 'I can see the number of posts each user has written' do
      @users.each do |user|
        expect(page).to have_content "#{user.posts_counter} Post"
      end
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      within '.columns' do
        find_link(href: user_path(@users[0].id)).click
      end
      expect(current_path).to eq user_path(@users[0].id)
    end
  end
end
