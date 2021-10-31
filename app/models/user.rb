class User < ApplicationRecord
  def recent_posts
    User.last(3).order(created_at: :asc)
  end
end
