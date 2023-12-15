class FeedGenerationJob < ApplicationJob
  queue_as :default

  def perform(action, options)
    if action == 'created_follower'
      rel = Relationship.find(options[:relationship_id])

      rel.followee.posts.each do |post|
        Feed.create!(
          post_id: post.id,
          creator_id: post.creator.id,
          user_id: rel.follower.id
        )
      end
    elsif action == 'created_post'
      post = Post.find(options[:post_id])

      post.creator.followers.each do |follower|
        Feed.create!(
          post_id: post.id,
          creator_id: post.creator.id,
          user_id: follower.id
        )
      end
    end
  end
end
