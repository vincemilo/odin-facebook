class LikesController < ApplicationController
  include ApplicationHelper

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post_id: params[:post_id])
    if @like.save && @like.post_id
      @notification = new_notification(User.find(@post.user_id), @like.id,
                                       'like')
    end
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path, status: :see_other
  end
end
