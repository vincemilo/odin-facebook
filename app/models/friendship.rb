class Friendship < ApplicationRecord
  belongs_to :users
  belongs_to :friends
end
