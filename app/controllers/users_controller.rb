class UsersController < ApplicationController

  def index
    @friends = present_friendships(current_user)
    @users = User.all
    @friend_request = FriendRequest.new
    @room = Room.new
    if params[:search_name].present?
     @users = User.where("lower(username) like ?","%#{params[:search_name].downcase}%")
    end
  end

  def present_friendships(user)
    friends = Array.new
    user.friendships.each do|friendship|
      if friendship.friend_a != user
        friends.push(friendship.friend_a)
      elsif friendship.friend_b != user
        friends.push(friendship.friend_b)
      end         
    end
    return friends
  end

end