class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_photo, PhotoUploader
  mount_uploader :cover_photo, CoverPhotoUploader
  mount_uploader :photo, PhotoUploader
  validates :f_name,presence: true,length: {minimum:5,maximum:20}
  validates :l_name,presence: true,length: {minimum:5,maximum:20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,length: {maximum: 40}, format: {with: VALID_EMAIL_REGEX }
  validates :phone_no,length: {maximum:20}
  validates :Dob_day,length: {maximum:2}
  validates :Dob_month,length: {maximum:20}
  validates :Dob_year,length: {maximum:4}
  validates :city,length: {maximum:20}
  validates :country,length: {maximum:20}
  validates :about_me,length: {maximum:1000}
  validates :university,length: {maximum:40}
  validates :qualification,length: {maximum:40}
  validates :university,length: {maximum:40}
  validates :university_start,length: {maximum:4}
  validates :university_end,length: {maximum:4}
  validates :university_city,length: {maximum:20}
  validates :university_country,length: {maximum:20} 
  validates :workplace,length: {maximum: 40}
  validates :workplace_city,length: {maximum:20}
  validates :workplace_country,length: {maximum:20}
  validates :interests,length: {maximum: 1000}
  validates :skills,length: {maximum: 1000}
  validates :languages,length: {maximum: 1000}
end