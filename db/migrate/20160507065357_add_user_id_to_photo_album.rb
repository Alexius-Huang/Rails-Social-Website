class AddUserIdToPhotoAlbum < ActiveRecord::Migration
  def change
    add_column :photo_albums, :user_id, :integer
  end
end
