class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      redirect_to question_path(@answer.question), flash: { :error => "Could not save your answer." }
    end
  end

  def mark_as_best
    question_id = params["question_id"].to_i
    answer_id = params["answer_id"].to_i
    question = Question.find(question_id)
    question.update(best_answer: answer_id)
    redirect_to question_path(question)
  end

  private

  def answer_params
    params[:comment][:user_id] = session[:user_id]
    params.require(:comment).permit(:is_up, :user_id, :votable_id, :votable_type)
  end
end
