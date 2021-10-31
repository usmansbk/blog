class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_comments(limit = 5)
    comments.last(limit)
  end
end
