class PhotoAlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_user

  def index
  	@photo_albums = @user.photo_albums.all
  	@new_photo_album = @user.photo_albums.new
  	@photo_highlight_token = "All Photos"
  	@photos = @user.photos.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def create
    @photo_album = @user.photo_albums.create(photo_album_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  	@photo_albums = @user.photo_albums.all
  	@photo_album = @user.photo_albums.find(params[:id])
  	@new_photo_album = @user.photo_albums.new
  	@photos = @photo_album.photos.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  	@new_photo = @photo_album.photos.new
    @photo_highlight_token = @photo_album.title
  end

  def destroy
    @photo_album = @user.photo_albums.find(params[:id])
    @photo_album.destroy
    redirect_to user_photo_albums_path(@user)
  end

  private 

  def photo_album_params
    params.require(:photo_album).permit(:title)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
