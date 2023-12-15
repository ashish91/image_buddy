class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    is_admin_or_moderator?
  end

  def show?
    is_admin_or_moderator?
  end

  def create?
    is_admin_or_moderator?
  end

  def new?
    is_admin_or_moderator?
  end

  def update?
    is_admin_or_moderator?
  end

  def edit?
    is_admin_or_moderator?
  end

  def destroy?
    is_admin_or_moderator?
  end

  private
    def is_admin_or_moderator?
      user.has_role?(:admin) || user.has_role?(:moderator)
    end
end
