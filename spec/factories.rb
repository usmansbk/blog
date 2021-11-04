FactoryBot.define do
	factory :user do
		name { "John Doe" }
		sequence :email do |n|
			"test#{n}@email.com"
		end
		password { "secret_token" }
		password_confirmation { "secret_token" }
		confirmed_at { Date.today }
	end

	factory :post do
		user
		title { "Post" }
		text { "Test post" }
	end

	factory :comment do
		user
		post
		text { "Test comment" }
	end

	factory :like do
		post
		user
	end
end