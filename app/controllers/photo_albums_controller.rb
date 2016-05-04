class PhotoAlbumsController < ApplicationController
  
  def index
  	@photo_albums = PhotoAlbum.all
  	@new_photo_album = PhotoAlbum.new
  	@photo_highlight_token = "All Photos"
  	@photos = Photo.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def create
    @photo_album = PhotoAlbum.create(photo_album_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  	@photo_albums = PhotoAlbum.all
  	@photo_album = PhotoAlbum.find(params[:id])
  	@new_photo_album = PhotoAlbum.new
  	@photos = @photo_album.photos.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  	@photo_highlight_token = @photo_album.title
  end

  def destroy
  end

  private 

  def photo_album_params
    params.require(:photo_album).permit(:title)
  end
end
