class GroupUsersController < ApplicationController
  def new
  end

  def create
    @group_user = GroupUser.new(user_id: current_user.id,group_id: params[:format])
    if !(@group_user.user.in? @group_user.group.users)
      if @group_user.save
        flash[:success] = "You have joined the group"
        redirect_back(fallback_location: root_path) and return
      else
        render 'new'
      end
    else
      flash[:danger] = "You are already member of this group"
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @friends = present_friendships(current_user)
    @group_users = GroupUser.where(group_id: params[:format])
    @users =  Array.new
    @group_users.each do|group_user|
      @users.push(group_user.user)
    end
    @group = Group.find(params[:format])
    if params[:search_name].present?
     @users = User.where("lower(username) like ?","%#{params[:search_name].downcase}%") & @users
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

  def destroy
    @group_user = GroupUser.find(params[:id])
    @group_user.destroy
    flash[:danger] = "You left the group"
    redirect_back(fallback_location: root_path)
  end
  # def already_joined_users(group)
  #   joined_users = Array.new
  #   group.users.each do|group|
  #     if friendship.friend_a != user
  #       friends.push(friendship.friend_a)
  #     elsif friendship.friend_b != user
  #       friends.push(friendship.friend_b)
  #     end         
  #   end
  #   return friends
  # end

end