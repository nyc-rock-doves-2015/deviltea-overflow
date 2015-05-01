class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(content: params[:content],
                   user_id: params[:user],
                   commentable_id: params[:commentable_id],
                   commentable_type: params[:commentable_type])
  end

end
