class Like < ApplicationRecord
  belongs_to :user
  belongs_to :parent, polymorphic: true

  enum :kind, [:upvote, :downvote]
end
