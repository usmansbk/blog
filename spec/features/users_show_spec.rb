require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  login_user
  background { visit user_path(@user.id) }
end
