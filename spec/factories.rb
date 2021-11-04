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

  factory :post do
    user
    title { 'Post' }
    text { 'Test post' }

    factory :post_with_comments do
      transient do
        comments_counter { 5 }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_counter, post: post, user: post.user)

        post.reload
      end
    end

    factory :post_with_likes do
      transient do
        likes_counter { 5 }
      end

      after(:create) do |post, evaluator|
        create_list(:like, evaluator.likes_counter, post: post, user: post.user)

        post.reload
      end
    end
  end

  factory :comment do
    user
    post
    text { 'Test comment' }
  end

  factory :like do
    post
    user
  end
end
