class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    p params
    Comment.create(content: params[:comment][:content],
                   user_id: 1, # session[:user_id]
                   commentable_type: params[:comment][:commentable_type],
                   commentable_id: params[:comment][:commentable_id])
  end

end
