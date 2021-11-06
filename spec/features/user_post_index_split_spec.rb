require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_posts_path(@user.id)
  end

  scenario 'Clicking a post should redirect to post show page' do
    post = @user.posts[0]
    click_link(post.id.to_s)
    expect(current_path).to eq user_post_path(@user.id, post.id)
  end
end
