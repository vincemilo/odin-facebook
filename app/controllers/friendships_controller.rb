class FriendshipsController < ApplicationController
  include ApplicationHelper

  def create
    @friend = User.find(params[:user_id])
    @friendship = Friendship.where('sent_to_id = ? AND sent_by_id = ?',
                                   current_user.id, @friend.id)

    if @friendship.blank?
      @friendship = current_user.friend_sent.build(sent_to_id: @friend.id)
    elsif @friendship && @friendship.status == false
      @friendship.status = true
    end

    if @friendship.save
      @notification = new_notification(current_user, current_user.id,
                                       'request')
      redirect_to @friend
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def update
    @friend = User.find(params[:user_id])
    @friendship = Friendship.where('sent_to_id = ? AND sent_by_id = ?',
                                   current_user.id, @friend.id).first

    if @friendship.update(status: true)
      redirect_to @friend
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def destroy
    @friend = User.find(params[:user_id])
    @friendship = Friendship.where('sent_to_id = ? AND sent_by_id = ?',
                                   current_user.id, @friend.id).first

    @friendship.destroy
    redirect_to @friend, status: :see_other
  end
end
