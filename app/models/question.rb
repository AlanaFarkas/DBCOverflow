class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :questions_tags, dependent: :destroy
  has_many :tags, through: :questions_tags
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  def points
    votes.sum(:vote_value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
