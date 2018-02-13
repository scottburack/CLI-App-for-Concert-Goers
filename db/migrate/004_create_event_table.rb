class CreateEventTable < ActiveRecord::Migration[4.2]

  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.integer :artist_id
      t.timestamps
    end
  end
end
