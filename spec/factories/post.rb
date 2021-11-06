FactoryBot.define do
  factory :post do
    user
    title { 'Post' }
    text { 'Test post' }

    factory :post_with_comments do
      transient do
        comments_counter { 5 }
      end

      comments do
        Array.new(comments_counter) { association(:comment) }
      end

      factory :post_with_comments_and_likes do
        transient do
          likes_counter { 5 }
        end

        likes do
          Array.new(likes_counter) { association(:like) }
        end
      end
    end
  end
end
