class Article < ActiveRecord::Base
	validates :title, :content, presence: true
	belongs_to :topic
	belongs_to :user
end
