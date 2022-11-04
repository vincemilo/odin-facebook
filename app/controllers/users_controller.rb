class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = User.all
  end

  def show
    @friend = User.find(params[:id])
    @friend_req_sent = Friendship.where('sent_to_id = ? AND sent_by_id = ?',
                                        @friend.id, current_user.id)
    @friend_req_received = Friendship.where('sent_to_id = ? AND sent_by_id = ?',
                                            current_user.id, @friend.id)
    if !@friend_req_received.blank?
      @pending_request = @friend_req_received.first.status
    elsif !@friend_req_sent.blank?
      @sent_request = @friend_req_sent.first.status
    end

    @posts = Post.where('user_id = ?', params[:id]).reverse
  end

  def notification_seen
    current_user.notice_seen = true
    current_user.save
  end
end
