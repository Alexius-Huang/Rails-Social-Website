class Skill < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :user
end
