class Post < ApplicationRecord
  validates :title, presence: true,
                    length: { maximum: 250, too_long: 'must not exceed 250 characters' }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :liked_by, class_name: "Like", through: :likes

  def recent_comments(limit = 5)
    comments.last(limit)
  end

  def liked?
    liked_by.exists?(user: current_user)
  end

  def update_counter(value)
    user.update(posts_counter: value)
  end
end
