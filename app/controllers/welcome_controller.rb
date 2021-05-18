class WelcomeController < ApplicationController
  def home
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

  def search
    @friend_request = FriendRequest.new
    @friends = present_friendships(current_user)
    @groups = Group.all
    @users=User.all
    @pages = Page.all
    if params[:search_name].present?
     @groups = Group.where("lower(group_name) like ?","%#{params[:search_name].downcase}%")
     @users = User.where("lower(username) like ?","%#{params[:search_name].downcase}%")
     @pages = Page.where("lower(page_name) like ?","%#{params[:search_name].downcase}%")
    else
      redirect_back(fallback_location: root_path)
    end
  end
end