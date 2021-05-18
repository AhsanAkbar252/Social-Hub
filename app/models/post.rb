class Post < ApplicationRecord
  belongs_to :page,optional: true
  belongs_to :group,optional: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :reactions, dependent: :destroy
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  mount_uploaders :videos, VideoUploader
  serialize :videos, JSON

  def can_add_as_friend(user)
    self != user && friendships_as_friend_a.where(friend_b_id: user.id).or(friendships_as_friend_b.where(friend_a_id: user.id)).count == 0 &&  
      friend_requests_as_requestor.where(receiver_id: user.id).or(friend_requests_as_receiver.where(requestor_id: user.id)).count == 0
  end
end