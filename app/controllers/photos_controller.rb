class PhotosController < ApplicationController
  before_action :find_photo_album

  def new
    @photo = @photo_album.photos.new
  end

  def create
    @photo = @photo_album.photos.create(photo_params)

    if @photo.save
      redirect_to photo_album_path(@photo_album)
    else
      render :new
    end
  end

  def show
    @photo = @photo_album.photos.find(params[:id])
  end

  def edit
    @photo = @photo_album.photos.find(params[:id])
  end

  def update
    @photo = @photo_album.photos.find(params[:id])

    if @photo.update(photo_params)
      redirect_to photo_album_path(@photo_album)
    else
      render :edit
    end
  end

  def destroy
    @photo = @photo_album.photos.find(params[:id])
    @photo.destroy
    redirect_to photo_album_path(@photo_album)
  end

  private

  def find_photo_album
    @photo_album = PhotoAlbum.find(params[:photo_album_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :content, :image)
  end
end
