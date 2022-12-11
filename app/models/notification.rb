# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user
  scope :requests, -> { where('notice_type = ?', 'request') }
  # scope :likes, -> { where('notice_type = like') }
  # scope :comments, -> { where('notice_type = comment') }
end
