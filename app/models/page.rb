class Page < ApplicationRecord
  has_many :posts
  has_many :page_followers
  has_many :users, through: :page_followers
  mount_uploader :cover_photo, CoverPhotoUploader
  mount_uploader :photo, PhotoUploader
  validates :page_name,length: {maximum:20}
  validates :sub_title,length: {maximum:20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :page_email,length: {maximum: 40}, format: {with: VALID_EMAIL_REGEX }
  validates :page_city,length: {maximum:20}
  validates :page_country,length: {maximum:20}
  validates :page_description,length: {maximum:1000}
  validates :page_facebook,length: {maximum: 40}
  validates :page_twitter,length: {maximum: 40}
  validates :page_instagram,length: {maximum: 40}
  validates :page_google_plus,length: {maximum: 40}

end