class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])

		@highlight_token = nil
  	@topics = @user.topics.all
  	@new_topic = @user.topics.new
  	@articles = @user.articles.order("created_at DESC")
    @article_sample = @articles.take(3)
    @truncate = true
    @pinterest = false

  	@photo_highlight_token = nil
  	@photo_albums = @user.photo_albums.all
  	@new_photo_album = @user.photo_albums.new
  	@photos = @user.photos.order("created_at DESC")
    @photo_sample = @photos.take(3)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :motto, :self_intro, :blog_title, :avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :password, :password_confirmation, :current_password)
  end
  
end