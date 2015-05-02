class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
  end

  def new
    @question= Question.new
  end

  def create
    q = Question.new(question_params)
    # setup using sessions, add current_user helper method?
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