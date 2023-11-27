class Like < ApplicationRecord
  belongs_to :user
  belongs_to :parent, polymorphic: true

  enum :kind, [:upvote, :downvote]

  after_create :increment_posts_likes
  after_destroy :decrement_posts_likes

  private
    def increment_posts_likes
      if kind == 'upvote'
        parent.increment!(:likes_count)
      elsif kind == 'downvote'
        parent.decrement!(:likes_count)
      end
    end

    def decrement_posts_likes
      if kind == 'upvote'
        parent.decrement!(:likes_count)
      elsif kind == 'downvote'
        parent.increment!(:likes_count)
      end
    end
end
