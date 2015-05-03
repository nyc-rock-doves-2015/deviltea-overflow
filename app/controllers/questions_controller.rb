class QuestionsController < ApplicationController

  def index
    if params[:sortby] == "highest-voted"
      p "highest votes"
      @questions = Question.sort_by_highest_votes
    elsif params[:sortby] == "trending"
      p "trending"
      @questions = Question.sort_by_trending
    else
      p "most-recent"
      @questions = Question.sort_by_most_recent
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
    @vote = Vote.new
  end

  def new
    @question= Question.new
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
