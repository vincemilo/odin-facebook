# frozen_string_literal: true

class AddNoticeSeenToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :notice_seen, :boolean
  end
end
