class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :title, :content, :user_id, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def self.sort_by_most_recent
    Question.order(created_at: :desc)
  end

  def self.sort_by_highest_votes
    Question.order(points: :desc)
  end

  def self.sort_by_trending
    # TODO: implement trending
    Question.order(points: :desc)
  end

  def alt_sort_answers
    
    (answers.to_a - Array(best_answer)).unshift(best_answer)
  end

  def sort_answers
    question = self
    sorted_answers = question.answers.order(points: :desc)
    sorted_answers.map do |answer|
      if question.best_answer == answer.id
        sorted_answers.unshift(answer)
        break
      end
    end
    sorted_answers
  end

end
