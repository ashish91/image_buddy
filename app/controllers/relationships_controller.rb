class RelationshipsController < ApplicationController

  def follow
    if current_user.id != params[:id]
      if relationship_exists?
        Relationship.find_by(
          follower_id: current_user.id,
          followee_id: params[:id]
        ).destroy!
      else
        Relationship.create!(
          follower_id: current_user.id,
          followee_id: params[:id]
        )
      end
    end

    redirect_to feeds_user_path(params[:id])
  end

  private
    def relationship_exists?
      Relationship.exists?(follower_id: current_user.id, followee_id: params[:id])
    end

end
