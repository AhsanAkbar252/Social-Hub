class Group < ApplicationRecord
  has_many :posts
  has_many :group_users
  has_many :users, through: :group_users
  mount_uploader :cover_photo, CoverPhotoUploader
  mount_uploader :photo, PhotoUploader
  validates :group_name,length: {maximum:20}
  validates :city,length: {maximum:20}
  validates :country,length: {maximum:20}
  validates :description,length: {maximum:1000}

end