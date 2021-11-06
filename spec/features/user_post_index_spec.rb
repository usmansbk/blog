require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  login_user
  background { visit user_posts_path(@user.id) }
end
