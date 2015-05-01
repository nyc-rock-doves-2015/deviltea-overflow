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
    # TODO: change to current user's id when sessions implemented
    params[:answer][:user_id] = 1
    params[:answer][:question_id] = params[:question_id]

    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end