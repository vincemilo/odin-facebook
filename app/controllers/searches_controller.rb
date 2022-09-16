class SearchesController < ApplicationController
  def index
    @users = User.where("first_name LIKE ?", "%#{params[:search]}%")
  end
end

