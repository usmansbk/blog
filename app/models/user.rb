class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  def recent_posts(limit = 3)
    posts.last(limit).order(created_at: :asc)
  end
end
