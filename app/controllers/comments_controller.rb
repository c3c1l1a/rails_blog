class CommentsController < ApplicationController
  def new; end

  def create
    data = params.require(:comment).permit(:text)
    post = Post.find(params[:post_id])
    comment = Comment.create!(
      post: post,
      author: current_user,
      text: data[:text]
    )
    comment.update_comments_counter_for_post
    redirect_to user_posts_path
  end
end
