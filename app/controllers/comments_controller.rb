class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id]), flash: { :error => "Could not save your comment." }
    end
  end

  private

  def comment_params
    params[:comment][:user_id] = session[:user_id]
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end

end
