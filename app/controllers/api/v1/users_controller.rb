class Api::V1::UsersController < ApplicationController
  before_action :set_users
  def index
    render json: @users
  end

  def show
    @user = @users.find params[:id]
    render json: @user
  end

  private

  def set_users
    @users = User.all
  end
end
