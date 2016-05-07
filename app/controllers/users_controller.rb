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

end