class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
