# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: {
    maximum: 280
  }

  scope :ordered, -> { order(id: :desc) }
end
