class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    render json: @posts
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@user)
    render json: @post
  end
end
