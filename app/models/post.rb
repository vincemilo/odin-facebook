# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :body, presence: true, length: {
    maximum: 280
  }
end
