class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = User.all
  end

  def show
    @friend = User.find(params[:id])
    @status = @friend.friends
  end

  def create
    
  end
end
