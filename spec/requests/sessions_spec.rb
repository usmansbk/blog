require 'swagger_helper'

RSpec.describe 'Session', type: :request do
  path '/api/users/sign_in' do

    post 'Authenticate new user' do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      response '201', 'Signed in successfully' do
        run_test!
      end
    end

  end
end
