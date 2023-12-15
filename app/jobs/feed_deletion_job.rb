class FeedDeletionJob < ApplicationJob
  queue_as :default

  def perform(follower_id:, followee_id:)
    follower = User.find(follower_id)
    followee = User.find(followee_id)

    Feed.where(
      user_id: follower.id,
      post_id: followee.posts.pluck(:id),
    ).destroy_all
  end
end
