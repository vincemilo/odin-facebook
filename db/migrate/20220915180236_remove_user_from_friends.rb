class RemoveUserFromFriends < ActiveRecord::Migration[7.0]
  def change
    remove_reference :friends, :user, null: false, foreign_key: true
  end
end
