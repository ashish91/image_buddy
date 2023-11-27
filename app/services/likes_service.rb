class LikesService

  def initialize(parent_id:, parent_type:, user:)
    @parent_id = parent_id
    @parent_type = parent_type
    @user = user

    @parent = parent_type.constantize.find(parent_id)
  end

  def toggle_upvote
    destroyed_vote = destroy_existing_vote!
    destroyed_vote == 'upvote' ? true : create_like('upvote')
  end

  def toggle_downvote
    destroyed_vote = destroy_existing_vote!
    destroyed_vote == 'downvote' ? true : create_like('downvote')
  end

  def get_post
    @parent.is_a?(Post) ? @parent : @parent.post
  end

  private
    def create_like(kind)
      like = Like.new(
        kind: kind,
        user_id: @user.id,
        parent_id: @parent_id,
        parent_type: @parent_type,
      )
      like.save
    end

    def destroy_existing_vote!
      vote = @user.likes.where(
        parent_id: @parent_id,
        parent_type: @parent_type,
      ).first

      return if vote.nil?

      vote.destroy
      vote.kind
    end
end
