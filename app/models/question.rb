class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :title, :content, :user_id, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
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

  def self.most_recent
    self.order(created_at: :DESC)
  end

  def self.most_points
    self.order(points: :DESC)
  end

end
