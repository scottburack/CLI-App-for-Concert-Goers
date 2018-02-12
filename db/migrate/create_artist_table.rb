class CreateArtistTable < ActiveRecord::Migration
  def change
    create_table do |t|
      t.string :name,
      t.timestamps
    end
  end
end
