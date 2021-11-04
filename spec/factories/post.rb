FactoryBot.define do
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
end
