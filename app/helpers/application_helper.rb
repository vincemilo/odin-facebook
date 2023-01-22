# frozen_string_literal: true

module ApplicationHelper
  def new_notification(user, notice_id, notice_type)
    notice = user.notifications.build(notice_id:, notice_type:)
    user.notice_seen = false
    user.save
    notice
  end

  def del_notification(obj, type)
    notification = Notification.where(notice_id: obj.id).where(notice_type: type)
    notification.destroy_all
  end

  def friend(post)
    user = User.find(post.user_id)
    "#{user.first_name} #{user.last_name}".to_s
  end

  def notice_button
    return 'button is-danger' if current_user.notice_seen == false

    'button is-link'
  end

  def find_user(user_id)
    user = User.find(user_id)
    return 'You' if user_id == current_user.id

    "#{user.first_name} #{user.last_name}"
  end

  def find_commenter(comment_id)
    commenter = Comment.find(comment_id).commenter
    find_user(commenter)
  end

  def liked?(obj)
    return true if find_like(obj).any?

    false
  end

  def find_like(obj)
    post = Like.where(user_id: current_user.id).where(post_id: obj.id)
    return post if post.any?

    Like.where(user_id: current_user.id).where(comment_id: obj.id)
  end

  def find_liker(like_id)
    liker = Like.find(like_id).user_id
    find_user(liker)
  end

  def like_post(post)
    like = current_user.likes.build(post_id: post.id)
    return unless like.save && like.post_id

    like_notice(post, like)
  end

  def like_comment(comment)
    like = current_user.likes.build(comment_id: comment.id)
    return unless like.save && like.comment_id

    like_notice(comment, like)
  end

  def like_notice(obj, like)
    # foo = user_id
    if obj.instance_of?(Post)
      new_notification(User.find(obj.user_id), like.id, 'like')
    else
      new_notification(User.find(obj.commenter), like.id, 'like')
    end
  end

  def find_obj(notice_id, type) # determines if obj is comment or like
    if type == 'comment'
      Comment.find(notice_id)
    else
      Like.find(notice_id)
    end
  end

  def find_comment(notice_id)
    like = Like.find(notice_id)
    Comment.find(like.comment_id)
  end

  def find_commented_post(notice_id)
    comment = find_comment(notice_id)
    Post.find(comment.post_id)
  end

  def timestamp(obj)
    obj.created_at.strftime('%b %d, %Y at %l:%M%P')
  end

  def find_avatar(id)
    User.find(id)
  end

  def friend_req_received(friend, user)
    Friendship.where('sent_to_id = ? AND sent_by_id = ?',
                     user.id, friend.id)
  end

  def friend_req_sent(friend, user)
    Friendship.where('sent_to_id = ? AND sent_by_id = ?',
                     friend.id, user.id)
  end

  def friends?(friend, user)
    received = friend_req_received(friend, user)
    sent = friend_req_sent(friend, user)
    return true if (!received.blank? && received.first.status == true) ||
                   (!sent.blank? && sent.first.status == true)
              
    false
  end

  def not_friends?(friend, user)
    return true if friend_req_received(friend, user).blank? &&
                   friend_req_sent(friend, user).blank?
    
    false
  end

  def pending_request?(friend, user)
    received = friend_req_received(friend, user)
    return true if !received.blank? && received.first.status == false

    false
  end

  def sent_request?(friend, user)
    sent = friend_req_sent(friend, user)
    return true if !sent.blank? && sent.first.status == false

    false
  end
end
