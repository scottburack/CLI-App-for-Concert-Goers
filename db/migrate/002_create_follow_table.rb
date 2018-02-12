class CreateFollowTable < ActiveRecord::Migration[4.2]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :artist_id
      t.timestamps
    end
  end
end
