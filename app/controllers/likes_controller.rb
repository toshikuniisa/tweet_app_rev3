class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.create(user: current_user, post: @post)
    redirect_to post_path(@post)
  end

  def destroy
    @like = Like.find_by(user: current_user, post: @post)
    @like.destroy
    redirect_to post_path(@post)
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
