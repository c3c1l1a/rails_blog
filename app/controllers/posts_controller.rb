class PostsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all.includes(:author)


    @comments_info = []
    @comments.each do |comment|
      user = comment.author
      @comments_info << {
        user_name: user.name,
        text: comment.text,
        post_id: comment.post_id
      }
    end
  end

  def new; end

  def create
    data = params.require(:post).permit(:title, :text)
    post = Post.create!(author: current_user,
                        title: data[:title],
                        text: data[:text],
                        comments_counter: 0,
                        likes_counter: 0)
    post.update_posts_counter_for_user
    redirect_to user_path current_user.id
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
