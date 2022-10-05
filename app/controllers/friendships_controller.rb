class FriendshipsController < ApplicationController
  def create
    @friend = User.find(params[:user_id])
    @friendship = current_user.friend_sent.build(sent_to_id: @friend.id)

    if @friendship.save
      redirect_to @friend
    else
      render root_path, status: :unprocessable_entity
    end
  end
end
