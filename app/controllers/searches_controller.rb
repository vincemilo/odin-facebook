class SearchesController < ApplicationController
  def index
    search = params[:search].capitalize
    @users = User.where('first_name LIKE ? OR last_name LIKE ?',
                        "%#{search}%", "%#{search}%")
  end
end
