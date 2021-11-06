require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_path(@user.id)
  end

  scenario 'I can see the profile picture' do
    expect(find('.user-avatar') { |img| img[:src] == get_photo(@user) }).to be_present
  end

  scenario 'I can see the username' do
    expect(page).to have_content @user.name
  end

  scenario 'I can see the number of posts' do
    expect(page).to have_content "#{@user.posts_counter} Post"
  end

  scenario 'I can see the bio' do
    expect(page).to have_content @user.bio
  end

  scenario 'I can see the first 3 posts' do
    expect(all('.post').length).to eq 3
  end

  scenario 'I can see view all post button' do
    expect(find_link('See all post').visible?).to be true
  end
end
