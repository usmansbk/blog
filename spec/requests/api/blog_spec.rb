require 'swagger_helper'

RSpec.describe 'Blog API', type: :request do
	path '/users/sign_in' do

		post 'Sign in user' do
			tags 'Auth'
			consumes 'application/json'

			response '200', 'logged in' do
				user = FactoryBot.create :user
				let(:user) { { email: user.email, password: user.password } }
				run_test!
			end
		end
	end
end
