class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :post_was_viewed!, only: [:show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def search
    @posts = Post.where("title like ?", "%#{search_params[:title]}%")
    @tags = Tag.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comment = Comment.new
    @upvote = @post.upvotes.where(user: current_user)
    @downvote = @post.downvotes.where(user: current_user)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      authorize @post
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).permit(:title, :body, :image)
    end

    def search_params
      params.permit(:title)
    end

    def post_was_viewed!
      PostsViewService.new(
        post: @post,
        user: current_user
      ).update_view!
    end
end
