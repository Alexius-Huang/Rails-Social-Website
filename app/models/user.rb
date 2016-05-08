class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :skills
  has_many :interests

  has_many :topics
  has_many :articles
  
  has_many :photo_albums
  has_many :photos
end
