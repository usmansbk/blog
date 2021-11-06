require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  login_user
  background { visit user_path(@user.id) }

  scenario "I can see the user's profile picture" do
    expect(find('img') { |img| img[:src] == get_photo(@user) }).to be_present
  end
  scenario 'I can see the username' do
    expect(page).to have_content @user.name
  end
  scenario 'I can see the number of posts' do
    expect(page).to have_content "#{@user.posts_counter} Post"
  end
end
