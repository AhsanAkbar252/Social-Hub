class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :friend_requests_as_requestor, 
         foreign_key: :requestor_id, 
         class_name: :FriendRequest
  has_many :friend_requests_as_receiver, 
         foreign_key: :receiver_id, 
         class_name: :FriendRequest

  has_many :requestors, through: :friend_requests_as_requestor
  has_many :receivers, through: :friend_requests_as_receiver



  has_many :friendships_as_friend_a, 
      foreign_key: :friend_a_id, 
      class_name: :Friendship

  has_many :friendships_as_friend_b, 
       foreign_key: :friend_b_id, 
       class_name: :Friendship


  has_many :friend_as, through: :friendships_as_friend_b
  has_many :friend_bs, through: :friendships_as_friend_a



  has_many :rooms_as_first_person, 
      foreign_key: :first_person_id, 
      class_name: :Room

  has_many :rooms_as_second_person, 
       foreign_key: :second_person_id, 
       class_name: :Room

  has_many :first_persons, through: :rooms_as_first_person
  has_many :second_persons, through: :rooms_as_second_person

  has_many :posts
  has_one :profile
  has_many :comments

  has_many :group_users
  has_many :groups, through: :group_users


  has_many :page_followers
  has_many :users, through: :page_followers

  has_many :reactions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true


  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end


  def friendships
      self.friendships_as_friend_a + self.friendships_as_friend_b
   end

  def rooms
      self.rooms_as_first_person + self.rooms_as_second_person
   end

  def friend_requests
      self.friend_requests_as_requestor + self.friend_requests_as_receiver
  end

  def can_add_as_friend(user)
    self != user && friendships_as_friend_a.where(friend_b_id: user.id).or(friendships_as_friend_b.where(friend_a_id: user.id)).count == 0 &&  
      friend_requests_as_requestor.where(receiver_id: user.id).or(friend_requests_as_receiver.where(requestor_id: user.id)).count == 0
  end

  def present_room(user)
    rooms_as_first_person.where(second_person_id: user.id).or(rooms_as_second_person.where(first_person_id: user.id)).first
  end

end
