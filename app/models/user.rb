class User < ApplicationRecord
  def recent_posts
    self.posts.last(3).order(created_at: :asc)
  end
end
