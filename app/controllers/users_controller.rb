class UsersController < ApplicationController

  def feeds
  end

  def posts
    @posts = Post.where(user_id: current_user.id)
  end

  def comments
    @comments = Comment.where(commenter_id: current_user.id)
  end

  def about
  end

end
