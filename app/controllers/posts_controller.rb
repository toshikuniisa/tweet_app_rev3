class PostsController < ApplicationController

  def index
    @post=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
end

def show
  @post = Post.find(params[:id])
  @likes_count=Like.where(post_id:@post.id).count
end

def edit
  @post = Post.find(params[:id])
end

def update
  post = Post.find(params[:id])
  post.update(post_params)
  redirect_to post
end

def destroy
  post = Post.find(params[:id])
  post.delete
  redirect_to posts_path
end

private
  def post_params
  params.require(:post).permit(:name,:title,:content,:image,:video)
end

end
