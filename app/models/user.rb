class User < ApplicationRecord
  has_many :comments, foreign_key: :comment_id
  has_many :posts, foreign_key: :post_id
  has_many :likes, foreign_key: :like_id

  def get_recent_posts
    posts.order('created_at Desc').limit(3)
  end
end