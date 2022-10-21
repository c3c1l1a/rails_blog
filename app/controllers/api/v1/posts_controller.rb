class Api::V1::PostsController < ApplicationController
	before_action :set_posts
	def index
		render :json => @posts
	end

	private 
	def set_posts 
		@user = User.find params[:user_id]
    @posts = @user.posts
	end
end