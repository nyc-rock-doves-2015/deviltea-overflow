class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :content, presence: true, length: { minimum: 2 }
  validates :user_id, :question_id, presence: true
end

