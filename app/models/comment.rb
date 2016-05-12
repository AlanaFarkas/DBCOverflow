class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, polymorphic: true
  belongs_to :answer, polymorphic: true

  validates :body, presence: true

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
