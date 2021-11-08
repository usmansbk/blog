class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  validates :name, :email, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  def admin?
    role == 'admin'
  end

  def recent_posts(limit = 3)
    posts.includes(:comments).order('created_at').last(limit)
  end
end
