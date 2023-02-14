# frozen_string_literal: true

class SearchesController < ApplicationController
  def index
    search = params[:search].capitalize
    @users = User.where('name LIKE ?', "%#{search}%")
  end
end
