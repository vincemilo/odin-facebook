class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.boolean :friend
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
