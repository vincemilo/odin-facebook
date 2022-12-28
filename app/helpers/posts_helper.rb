# frozen_string_literal: true

module PostsHelper
  def liked?(post)
    return true if find_like(post).any?

    false
  end

  def find_like(post)
    Like.where(user_id: current_user.id).where(post_id: post.id)
  end
end
