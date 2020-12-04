class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def show
    @likes_count = Like.where(post: @post).count
  end

  def edit ;end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.delete
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:name,:title,:content,:image,:video).merge(user: current_user)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
