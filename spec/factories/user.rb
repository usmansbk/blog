FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  sequence :name do |n|
    "John Doe #{n}"
  end

  factory :user do
    name
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

      posts do
        Array.new(posts_counter) { association(:post) }
      end
    end
  end
end
