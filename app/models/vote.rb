class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, polymorphic: true
  belongs_to :answer, polymorphic: true

  validates :vote_value, presence: true
end
