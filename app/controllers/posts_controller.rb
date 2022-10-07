class PostsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all

    @comments_info = []
    @comments.each do |comment|
      user = User.find comment.author_id
      @comments_info << {
        user_name: user.name,
        text: comment.text,
        post_id: comment.post_id
      }
    end
  end

  def new
  end

  def show
    @post = Post.find params[:id]
    @author = User.find @post.author_id
    @comments_counter = @post.comments_counter
    @likes_counter = @post.likes_counter

    @comments = Comment.all
    @comments_info = []
    @comments.each do |comment|
      next unless @post.id == comment.post_id

      user = User.find comment.author_id
      @comments_info << {
        user_name: user.name,
        text: comment.text
      }
    end
  end
end
