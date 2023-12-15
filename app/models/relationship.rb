class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  after_commit :create_feed, on: [:create]
  after_commit :delete_feed, on: [:destroy]

  private
    def create_feed
      FeedGenerationJob.perform_later('created_follower', { relationship_id: id })
    end

    def delete_feed
      FeedDeletionJob.perform_later(follower_id: follower.id, followee_id: followee.id)
    end
end
