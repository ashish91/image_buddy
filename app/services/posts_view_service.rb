class PostsViewService
  def initialize(post:, user:)
    @post = post
    @user = user
  end

  def update_view!
    return if View.exists?(viewer: @user, post: @post)

    View.create!(viewer: @user, post: @post)
  end

end
