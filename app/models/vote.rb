class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user_id, :votable_id, :votable_type, presence: true
  validates_inclusion_of :is_up, in: [true, false]

  after_save :update_vote_count

  def tally
    # I might think about a helper class called TallyAgent.new(votable_type,
    # id).tally #=> "33"
    case votable_type
    when "Question"
      question = Question.find(votable_id)
      question.points
    when "Answer"
      answer = Answer.find(votable_id)
      answer.points
    when "Comment"
      comment = Comment.find(votable_id)
      comment.points
    end
  end

  private

  def update_vote_count
    change = (is_up) ? 1 : -1

    case votable_type
    when "Question"
      question = Question.find(votable_id)
      question.increment(:points, change)
      question.save
    when "Answer"
      answer = Answer.find(votable_id)
      answer.increment(:points, change)
      answer.save
    when "Comment"
      comment = Comment.find(votable_id)
      comment.increment(:points, change)
      comment.save
    end
  end
end
