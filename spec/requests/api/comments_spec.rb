require 'swagger_helper'

RSpec.describe 'Comments API', type: :request do
  login_user
  path '/api/posts/{post_id}/comments' do
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
    let(:post) { FactoryBot.create :post, user: @user }

    get 'list comments' do
      security [bearer_auth: []]
      response 200, 'successful' do
        let(:Authorization) { "Bearer #{@user.jti}" }
        let(:post_id) { post.id }
        run_test!
      end
    end

    # post 'create comment' do
    #   security [bearer_auth: []]
    #   response 200, 'successful' do
    #     let(:Authorization) { "Bearer #{@user.jti}" }
    #     let(:comment) { { text: "Hello" } }
    #     let(:post_id) { post.id }
    #     run_test!
    #   end
    # end
  end
end
