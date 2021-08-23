class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def edit 
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        ContactMailer.contact_mail(@post).deliver
        redirect_to posts_path, notice: "投稿完了" 
      else
        render :new
      end
    end
  end

  def update
      if @post = Post.find(params[:id])
        if @post.user_id == current_user.id
        @post.update(post_params)
        redirect_to posts_path, notice: "投稿を編集しました。" 
        end
      else
        render :edit
      end
    end

  def destroy
    if @post.user_id == current_user.id
    @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "投稿を削除しました。" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:caption, :image, :image_cache)
  end
end

