require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  login_user
  background do
    @post = FactoryBot.create :post_with_comments, comments_counter: 3, user: @user
    visit user_post_path(@user.id, @post.id)
  end

  scenario 'I can see the title' do
    expect(page).to have_content @post.title
  end

  scenario 'I can see the author' do
    expect(page).to have_content @user.name
  end

  scenario 'I can see the number of comments' do
    expect(page).to have_content "3 Comments" 
  end

  scenario 'I can see the number of likes' do
    expect(find_button("#{@post.likes_counter} Likes")).to be_present  
  end

  scenario 'I can see the text' do
    expect(page).to have_content @post.text
  end
end
