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
    self.answers.order(points: :desc)
  end

end
