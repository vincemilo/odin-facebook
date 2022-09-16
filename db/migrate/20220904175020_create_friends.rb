class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    drop_table :friends do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
