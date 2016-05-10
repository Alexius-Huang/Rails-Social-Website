class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_user
  before_action :find_photo_album

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
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @photo = @photo_album.photos.find(params[:id])
    @photo.destroy
    redirect_to user_photo_album_path(@user ,@photo_album)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_photo_album
    @photo_album = @user.photo_albums.find(params[:photo_album_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :content, :image)
  end
end
