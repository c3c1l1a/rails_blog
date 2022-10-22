class Api::V1::CommentsController < ApplicationController
	before_action :set_users
	def index
		comments = @post.comments
		render :json => comments
	end

	def show
		comment = @post.comments.find params[:id]
		render :json => comment
	end

	def create
		comment = Comment.new(@post, @user, Text: 'api comment',)
		if comment.save
	    render json: CategoryRepresenter.new(comment).as_json, status: :created
	  else
	    render json: comment.errors, status: :unprocessable_entity
	end

	private 
	def set_users 
		@user = User.find params[:user_id]
		@post = @user.posts.find params[:post_id]
	end
end