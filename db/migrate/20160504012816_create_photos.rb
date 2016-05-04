class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :content
      t.integer :photo_album_id

      t.timestamps null: false
    end
  end
end
