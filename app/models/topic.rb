class Topic < ActiveRecord::Base
	validates :title, presence: true
	has_many :articles, dependent: :destroy
	belongs_to :user
end
