require 'swagger_helper'

RSpec.describe 'Blog Posts API', type: :request do
  path '/api/posts' do
    get 'list posts' do
      security [bearer_auth: []]

      response 200, 'successful' do
        login_user
        let(:Authorization) { "Bearer #{@user.jti}" }
        run_test!
      end

      response 401, 'authentication failed' do
        run_test!
      end
    end
  end
end
