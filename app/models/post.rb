class Post < ApplicationRecord
  validates :title, presence: true,
                    length: { maximum: 250, too_long: 'must not exceed 250 characters' }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, counter_cache: :likes_counter
  has_many :users, through: :likes, counter_cache: :likes_counter

  def recent_comments(limit = 5)
    comments.last(limit)
  end

  def liked? id
    users.exists?(id)
  end

  def update_counter(value)
    user.update(posts_counter: value)
  end
end
