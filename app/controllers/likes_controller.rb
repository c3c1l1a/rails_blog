class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.create!(post: post, author: current_user)
    like.update_likes_counter_for_post
    redirect_to user_posts_path
  end
end
