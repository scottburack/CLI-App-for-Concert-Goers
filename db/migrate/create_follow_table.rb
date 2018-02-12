class CreateFollowTable < ActiveRecord::Migration
  def change
    create_table do |t|
      t.integer :user_id,
      t.integer :artist_id,
      t.timestamps
  end
end
