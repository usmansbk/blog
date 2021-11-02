class User < ApplicationRecord
  validates :name, presence: { message: t('no_name') }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_posts(limit = 3)
    posts.last(limit)
  end
end
