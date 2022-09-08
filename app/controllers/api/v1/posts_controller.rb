class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    render json: @posts
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find(params[:user_id])
    render json: @post
  end
end
