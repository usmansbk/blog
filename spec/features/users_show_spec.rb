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

  scenario "User's post should redirect to post show page" do
    click_link(@user.recent_posts[0].id.to_s)
    expect(current_path).to eq user_post_path(@user.id, @user.recent_posts[0].id)
  end

  scenario "See all post should redirect to user's posts index page" do
    click_link('See all post')
    expect(current_path).to eq user_posts_path(@user.id)
  end
end
