class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable 
  has_many :comments, foreign_key: :comment_id
  has_many :posts, foreign_key: :post_id
  has_many :likes, foreign_key: :like_id

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil:true }

  def recent_posts
    posts.order('created_at Desc').limit(3)
  end
end
