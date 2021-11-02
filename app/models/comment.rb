class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :comments_counter

  def update_counter(value)
    post.update(comments_counter: value)
  end
end
