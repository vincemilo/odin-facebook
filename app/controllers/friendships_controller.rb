class FriendshipsController < ApplicationController
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
      redirect_to @friend
    else
      render root_path, status: :unprocessable_entity
    end
  end
end
