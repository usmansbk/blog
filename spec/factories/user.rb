FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    name { 'John Doe' }
    email
    password { 'secret_token' }
    password_confirmation { 'secret_token' }
    confirmed_at { Date.today }

    factory :admin do
      role { 'admin' }
    end

    factory :user_with_posts do
      transient do
        posts_counter { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_counter, user: user)

        user.reload
      end
    end
  end
end
