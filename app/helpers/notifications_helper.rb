# frozen_string_literal: true

module NotificationsHelper
  def find_obj(notice_id, type)
    if type == 'comment'
      Comment.find(notice_id)
    else
      Like.find(notice_id)
    end
  end
end
