class Api::V1::CommentsController < ApplicationController
	before_action :set_users
	def index
		@post = @user.posts.find params[:post_id]
		@comments = @post.comments
		render :json => @comments
	end

	def show
		@post = @user.posts.find params[:post_id]
		@comment = @post.comments.find params[:id]
		render :json => @comment
	end

	private 
	def set_users 
		@user = User.find params[:user_id]
	end
end