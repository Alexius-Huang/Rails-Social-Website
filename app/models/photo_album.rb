class PhotoAlbum < ActiveRecord::Base
	validates :title, presence: true
	has_many :photos
end
