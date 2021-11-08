require 'swagger_helper'

RSpec.describe 'Blog API', type: :request do
  path '/api/users/sign_in' do
    post 'Log in user' do
      tags 'Auth'
      response '200', 'Signed in' do
        user = FactoryBot.create :user
        let(:api_user) { { email: user.email, password: user.password } }
        run_test!
      end
    end
  end
end
