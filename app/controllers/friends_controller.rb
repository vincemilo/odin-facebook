class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

end
