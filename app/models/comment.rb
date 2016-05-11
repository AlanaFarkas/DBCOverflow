class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, polymorphic: true
  belongs_to :answer, polymorphic: true

  validates :body, presence: true
end
