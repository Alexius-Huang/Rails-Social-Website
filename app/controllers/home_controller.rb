class HomeController < ApplicationController
  def welcome
  	@highlight_token = nil
  	@topics = Topic.all
  	@new_topic = Topic.new
  	@articles = Article.order("created_at DESC").take(3)

  	@photo_highlight_token = nil
  	@photo_albums = PhotoAlbum.all
  	@new_photo_album = PhotoAlbum.new
  	@photos = Photo.order("created_at DESC").take(3)
  end
end
