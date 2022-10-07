class PostsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all

    @comments_info = []
    @comments.each do |comment|
      pp comment
      user = User.find comment.author_id
      @comments_info << {
        user_name: user.name,
        text: comment.text,
        post_id: comment.post_id
      }
    end
  end

  def show; end
end
