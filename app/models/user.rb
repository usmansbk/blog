class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  def recent_posts(limit = 3)
    posts.last(limit).order(created_at: :asc)
  end
end
