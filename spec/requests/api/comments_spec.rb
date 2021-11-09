require 'swagger_helper'

RSpec.describe 'Comments API', type: :request do
  login_user
  path '/api/posts/{post_id}/comments' do
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
    let(:Authorization) { "Bearer #{@user.jti}" }

    get 'list comments' do
      security [bearer_auth: []]
      response 200, 'successful' do
        let(:post_id) { FactoryBot.create(:post, user: @user).id }
        run_test!
      end
    end

    post 'create comment' do
      security [bearer_auth: []]
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }
      response 201, 'successful' do
        let(:comment) { { text: 'Text' } }
        let(:post_id) { FactoryBot.create(:post, user: @user).id }
        run_test!
      end
    end
  end
end
