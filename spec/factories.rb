FactoryBot.define do
	sequence :email do |n|
		"test#{n}@example.com"
	end

	factory :user do
		name { "John Doe" }
		email
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