class Like < ApplicationRecord
	belongs_to :user, class_name: 'User'
	belongs_to :post, class_name: 'Post'

	def update_likes_counter_for_post
		post.increment!(:likes_counter)
	end
end