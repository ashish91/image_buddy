class LikesController < ApplicationController
  before_action :set_likes_service, only: [:upvote, :downvote]

  def upvote
    respond_to do |format|
      if @likes_service.toggle_upvote
        format.html { redirect_to post_url(@post) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def downvote
    respond_to do |format|
      if @likes_service.toggle_downvote
        format.html { redirect_to post_url(@post) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def likes_params
      params.fetch(:like, {}).permit(:parent_id, :parent_type)
    end

    def set_likes_service
      @likes_service = LikesService.new(
        user: current_user,
        parent_id: likes_params[:parent_id],
        parent_type: likes_params[:parent_type],
      )

      @post = @likes_service.get_post
    end
end
