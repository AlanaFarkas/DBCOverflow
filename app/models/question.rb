class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :questions_tags
  has_many :tags, through: :questions_tags
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end