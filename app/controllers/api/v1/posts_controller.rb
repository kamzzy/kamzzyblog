class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    render json: @posts
  end
end
