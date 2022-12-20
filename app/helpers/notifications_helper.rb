# frozen_string_literal: true

module NotificationsHelper
  def find_user(user_id)
    user = User.find(user_id)
    return 'You' if user_id == current_user

    "#{user.first_name} #{user.last_name}"
  end

  def find_commenter(comment_id)
    commenter = Comment.find(comment_id).commenter
    return 'You' if commenter == current_user.id

    find_user(commenter)
  end
end
