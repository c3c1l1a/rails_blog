class Api::V1::CommentsController < ApplicationController
	load_and_authorize_resource
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
		comment = Comment.new(@post, current_user, Text: params.require(:comment).permit(:text) )
		if comment.save
	    render json: coment, status: :created
	  else
	    render json: comment.errors, status: :unprocessable_entity
	  end
	end

	private 
	def set_users 
		@user = User.find params[:user_id]
		@post = @user.posts.find params[:post_id]
	end
end