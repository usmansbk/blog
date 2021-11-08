require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_path(@user.id)
  end

  context 'Interaction' do
    scenario "Clicking user's post should redirect to post show page" do
      post = @user.recent_posts[0]
      click_link(post.id.to_s)
      expect(current_path).to eq user_post_path(@user.id, post.id)
    end

    scenario "Clicking 'See all post' should redirect to user's posts index page" do
      click_link('See all post')
      expect(current_path).to eq user_posts_path(@user.id)
    end
  end
end
