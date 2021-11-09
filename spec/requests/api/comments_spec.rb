require 'swagger_helper'

RSpec.describe 'Comments API', type: :request do
  path '/api/posts/{post_id}/comments' do
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get 'list comments' do
      response 200, 'successful' do
        let(:post_id) { '123' }
        run_test!
      end
    end

    post 'create comment' do
      response 200, 'successful' do
        let(:post_id) { '123' }
        run_test!
      end
    end
  end
end
