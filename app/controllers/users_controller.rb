class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @posts = Post.where(author_id: @user)
  end
end
