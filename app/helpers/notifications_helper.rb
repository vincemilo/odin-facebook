# frozen_string_literal: true

module NotificationsHelper
  def user_name(comment)
    user = User.find(comment.commenter)
    return 'You' if user == current_user

    "#{user.first_name} #{user.last_name}"
  end
end
