# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      @notification = new_notification(User.find(@post.user_id), current_user.id,
                                       'comment')
    end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
