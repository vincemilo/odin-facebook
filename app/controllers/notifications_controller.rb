# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!, :saw_notice

  def index
    @notifications = Notification.where('user_id = ?', current_user.id)
    return if @notifications.blank?

    @user_requests = []

    @notifications.requests.each do |notification|
      @user_requests << User.find(notification.notice_id)
    end
  end

  def destroy
    @notifications = Notification.where('user_id = ?', current_user.id)
    return if @notifications.blank?

    @notifications.destroy_all
    redirect_back(fallback_location: posts_path, status: :see_other)
  end

  private

  def saw_notice
    current_user.notice_seen = true
    current_user.save
  end
end
