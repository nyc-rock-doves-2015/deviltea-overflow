class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :is_up, :user_id, :votable_id, presence: true
end
