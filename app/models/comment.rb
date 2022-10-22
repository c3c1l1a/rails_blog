class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_comments_counter_for_post
    post.increment!(:comments_counter)
  end

  def as_json(_options = {})
    {
      id: id,
      photo: text
    }
  end
end
