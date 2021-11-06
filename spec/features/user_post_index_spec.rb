require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_posts_path(@user.id)
  end

  scenario 'I can see the profile picture' do
    expect(find('.user-avatar') { |img| img[:src] == get_photo(@user) }).to be_present
  end

  scenario 'I can see the username' do
    expect(page).to have_content @user.name
  end

  scenario 'I can see the number of posts' do
    expect(page).to have_content "#{@user.posts_counter} Posts"
  end

  scenario "I can see a post's title" do
    expect(page).to have_content @user.posts[0].title
  end

  scenario "I can see some of the post's body" do
    expect(page).to have_content @user.posts[0].text.slice(0, 100)
  end

  scenario 'I can see the first comments on a post' do
    @user.posts[0].recent_comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end

  scenario 'I can see how many likes a post has' do
    expect(page).to have_content "#{@user.posts[0].likes_counter} Like"
  end
end
