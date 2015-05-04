class AnswersController < ApplicationController

  def create
    @answer = Question.find(params[:question_id]).answers.build(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      redirect_to question_path(@answer.question), flash: { :error => "Could not save your answer." }
    end
  end

  def mark_as_best
    # We can tighten things up a little bit
    Question.find(params[:question_id])
    question.update(best_answer: params[:answer_id])

    redirect_to question_path(question)
  end

  private

  def answer_params
    # I think you can add :user_id via some method that hangs on permit() so
    # that you don't have to do this bit of logic.  It will do it for you.
    #
    # I can't remember the syntax right now, but itwould be nice to not have
    # that params[] munging going on here.  This one statement does all the
    # work forr you in a clean fashion.
    params.require(:answer).permit(:content, :user_id).merge(user_id: session[:user_id])
  end
end
