class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:user_id])
    @user = User.find(params[:user_id])
  end
end