class PhotoAlbumsController < ApplicationController
  def index
  	@photo_albums = PhotoAlbum.all
  	@new_photo_album = PhotoAlbum.new 
  end

  def show
  end

  def destroy
  end
end
