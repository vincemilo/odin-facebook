class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where('user_id = ?', current_user.id)
    return if @notifications.blank?

    @requests = []

    @notifications.each do |notification|
      if notification.notice_type == 'request'
        @requests << User.find(notification.notice_id)
      end
    end

    # @requests.each do |request|
    #   @users << User.find(request.notice_id)
    # end
  end
end
