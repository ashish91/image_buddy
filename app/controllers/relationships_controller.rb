class RelationshipsController < ApplicationController

  def follow
    if current_user.id != params[:id] && !relationship_exists?
      Relationship.create!(
        follower_id: current_user.id,
        followee_id: params[:id]
      )
    end
    debugger

    redirect_to feeds_user_path(params[:id])
  end

  private
    def relationship_exists?
      Relationship.exists?(follower_id: current_user.id, followee_id: params[:id])
    end

end
