class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  validates :content, :user_id, :commentable_id, presence: true
end
