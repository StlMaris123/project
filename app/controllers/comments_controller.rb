class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to :back, notice: 'comment successfully posted'
    else
      redirect_to :back, notice: 'error posting comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Micropost.find_by_id(params[:micropost_id]) if params[:micropost_id]
  end

end
