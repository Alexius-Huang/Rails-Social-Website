class Photo < ActiveRecord::Base
	validates :title, :content, :image, presence: true
	belongs_to :photo_album
	belongs_to :user
	mount_uploader :image, ImageUploader
end
