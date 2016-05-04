class Photo < ActiveRecord::Base
	validates :title, :content, :image, presence: true
	belongs_to :photo_albums
	mount_uploader :image, ImageUploader
end
