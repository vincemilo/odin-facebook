class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
    @friends = User.all
  end

  def show
    @friend = User.find(params[:id])
  end
end
