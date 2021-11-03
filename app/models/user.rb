class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :delete_all

  def recent_posts(limit = 3)
    posts.includes(:comments).last(limit)
  end

  def like(post_id)
    likes.find_by(post_id: post_id)
  end
end
