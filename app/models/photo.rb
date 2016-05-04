class Photo < ActiveRecord::Base
	validates :title, :content, presence: true
	belongs_to :photo_albums
end
