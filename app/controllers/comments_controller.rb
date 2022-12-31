# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

  def show
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      @notification = new_notification(User.find(@post.user_id), @comment.id,
                                       'comment')
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    del_notification(@comment, 'comment')
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
