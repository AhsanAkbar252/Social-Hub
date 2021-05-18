class PageFollowersController < ApplicationController 
  def new
  end

  def create
    @page_follower = PageFollower.new(user_id: current_user.id,page_id: params[:format])
    if !(@page_follower.user.in? @page_follower.page.users)
      if @page_follower.save
        flash[:success] = "You have joined the Page"
        redirect_back(fallback_location: root_path) and return
      else
        render 'new'
      end
    else
      flash[:danger] = "You are already following this page"
      redirect_back(fallback_location: root_path)
    end
  end

  def index
  @friends = present_friendships(current_user)
  @page_followers = PageFollower.where(page_id: params[:format])
  @users =  Array.new
  @page_followers.each do|page_follower|
    @users.push(page_follower.user)
  end
  @page = Page.find(params[:format])
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
    @page_follower = PageFollower.find(params[:id])
    @page_follower.destroy
    flash[:danger] = "You unfollowed the group"
    redirect_back(fallback_location: root_path)
  end
end