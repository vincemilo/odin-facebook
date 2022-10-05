class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = User.all
  end

  def show
    @friend = User.find(params[:id])
    @friendship = Friendship.where('sent_to_id = ? AND sent_by_id = ?',
      @friend.id, current_user.id)
  end
end
