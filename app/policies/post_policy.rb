class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    has_admin_privs_or_post_creator?
  end

  def edit?
    has_admin_privs_or_post_creator?
  end

  def destroy?
    has_admin_privs_or_post_creator?
  end

  private
    def has_admin_privs_or_post_creator?
      user.has_role?(:admin) || user.has_role?(:moderator) || post.creator_id == user.id
    end
end
