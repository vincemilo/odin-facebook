module ApplicationHelper
  def new_notification(user, notice_id, notice_type)
    notice = user.notifications.build(notice_id:, notice_type:)
    user.notice_seen = false
    user.save
    notice
  end
end
