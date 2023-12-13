class UsersController < ApplicationController
  before_action :set_user, only: [:feeds, :posts, :comments, :about]

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

  private
    def set_user
      @user = User.find(params[:id])
    end

end
