class LikesController < ApplicationController
  include ApplicationHelper

  def create
    if params[:comment_id].nil?
      @post = Post.find(params[:post_id])
      like_post(@post)
    elsif params[:post_id].nil?
      @comment = Comment.find(params[:comment_id])
      like_comment(@comment)
    end

    redirect_back(fallback_location: posts_path)
  end

  def destroy
    @like = Like.find(params[:id])
    del_notification(@like, 'like') # remove associated notice
    @like.destroy
    redirect_back(fallback_location: posts_path, status: :see_other)
  end
end
