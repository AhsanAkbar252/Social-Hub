class Room < ApplicationRecord
  belongs_to :first_person, class_name: :User
  belongs_to :second_person, class_name: :User
  has_many :room_messages, dependent: :destroy,
                         inverse_of: :room
end
