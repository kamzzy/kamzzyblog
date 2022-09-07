class Api::V1::CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:user_id])
    @user = User.find(params[:user_id])
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: @comment, status: :created
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit!
  end
end
