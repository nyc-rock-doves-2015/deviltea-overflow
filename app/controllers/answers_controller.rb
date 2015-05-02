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
    puts "HERE ARE THE PARAMSSSSSS:"
    puts params
    puts "XXXXXXXXX"
    question = params["question"]
    answer = params["answer"]
    puts "HERE IS WHAT IS IN ANSWER"
    puts answer
    puts "THERE IT WAS"
    question.best_answer = answer.id
    redirect_to question_path(question)
  end

  private

  def answer_params
    params[:answer][:user_id] = session[:user_id]
    params[:answer][:question_id] = params[:question_id]

    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
