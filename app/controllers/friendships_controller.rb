class FriendshipsController < ApplicationController
  def create
    return if current_user.id == params[:user_id]
    
  end
end
