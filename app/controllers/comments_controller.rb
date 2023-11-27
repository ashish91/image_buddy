class CommentsController < ApplicationController

  def create
    @parent = Post.find(comment_params[:parent_id])
    @comment = Comment.new(
      content: comment_params[:content],
      creator_id: current_user.id,
      parent_id: comment_params[:parent_id],
      parent_type: comment_params[:parent_type],
    )

    @post = parent.is_a?(Post) ? @parent : @parent.post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.fetch(:comment, {}).permit(:content, :post_id, :post_type)
    end

end
