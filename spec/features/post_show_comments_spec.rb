require 'rails_helper'

RSpec.feature 'Post show comments page', type: :feature do
  login_user
  background do
    @post = FactoryBot.create :post_with_comments, comments_counter: 3, user: @user
    visit user_post_path(@user.id, @post.id)
  end

  scenario 'I can see the title' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.user.name
    end
  end

  scenario 'I can see the each comment' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
