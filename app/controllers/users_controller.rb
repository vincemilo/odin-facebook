# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = User.all
  end

  def show
    @friend = User.find(params[:id])
    @posts = Post.where('user_id = ?', @friend.id).ordered
  end

  def notification_seen
    current_user.notice_seen = true
    current_user.save
  end
end
