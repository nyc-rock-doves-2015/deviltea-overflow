class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      redirect_to question_path(@answer.question), flash: { :error => "Could not save your answer." }
    end
  end

  private

  def answer_params
    params[:comment][:user_id] = session[:user_id]
    params.require(:comment).permit(:is_up, :user_id, :votable_id, :votable_type)
  end
end