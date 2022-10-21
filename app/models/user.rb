class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  def recent_posts
    posts.order('created_at Desc').limit(3)
  end

  def as_json(options={})
    { 
      :id => self.id,
      :name => self.name,
        :photo => self.photo,
        :posts_counter => self.posts_counter,
      
    }
  end
end
