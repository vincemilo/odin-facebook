# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!, :saw_notice

  def index
    @notifications = Notification.where('user_id = ?', current_user.id)
    return if @notifications.blank?

    @requests = []

    @notifications.each do |notification|
      @requests << User.find(notification.notice_id) if notification.notice_type == 'request'
    end

    # @requests.each do |request|
    #   @users << User.find(request.notice_id)
    # end
  end

  private

  def saw_notice
    current_user.notice_seen = true
    current_user.save
  end
end
