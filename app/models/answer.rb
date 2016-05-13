class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :body, presence: true

  def points
    votes.sum(:vote_value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
