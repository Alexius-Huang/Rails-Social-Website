class PhotoAlbum < ActiveRecord::Base
	validates :title, presence: true
	has_many :photos, dependent: :destroy
	belongs_to :user
end
