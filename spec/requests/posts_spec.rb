require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  login_user

  describe 'GET #index' do
    before(:example) { get user_posts_path(@user.id) }

    it 'should have correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before(:example) do
      post = FactoryBot.create :post, user: @user
      get user_post_path(@user.id, post.id)
    end

    it 'should have correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end
  end
end
