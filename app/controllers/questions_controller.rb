class QuestionsController < ApplicationController
  include SessionHelper

  def index
    @questions = if params[:sortby] == "highest-voted"
      p "highest votes"
      Question.sort_by_highest_votes
    elsif params[:sortby] == "trending"
      p "trending"
      Question.sort_by_trending
    else
      p "most-recent"
      Question.sort_by_most_recent
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
    @vote = Vote.new
  end

  def new
    if current_user
      @question= Question.new
    else
      flash[:error] = "Please login in to view that resource."
      redirect_to questions_path
    end
  end

  def create
    q = Question.new(question_params)
    q.user_id = session[:user_id]
    if q.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
