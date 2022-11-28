# frozen_string_literal: true

module ApplicationHelper
  def new_notification(user, notice_id, notice_type)
    notice = user.notifications.build(notice_id:, notice_type:)
    user.notice_seen = false
    user.save
    notice
  end

  def friend(post)
    user = User.find(post.user_id)
    "#{user.first_name} #{user.last_name}".to_s
  end

  def notice_button
    return 'button is-danger' if current_user.notice_seen == false

    'button is-link'
  end
end
