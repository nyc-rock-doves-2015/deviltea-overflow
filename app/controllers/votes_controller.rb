class VotesController < ApplicationController
  def create
    puts "Here are the paramssssssss"
    puts params
    puts "Why isn't _vote_buttons.html.erb sending the hidden field params?"
    id = params[:vote][:votable_id]
    type = params[:vote][:votable_type]
    is_up = params[:vote][:up]

    pos_or_neg = 0
    is_up ? pos_or_neg = 1 : pos_or_neg = -1

    case type
    when "Question"
      question = Question.find(id)
      question.score += pos_or_neg
    when "Answer"
      answer = Answer.find(id)
      answer.score += pos_or_neg
    when "Comment"
      comment = Comment.find(id)
      comment.score += pos_or_neg
    end

    Vote.create(up: is_up,
              votable_id: id,
              votable_type: type,
              user_id: session['user_id'])
  end
end
