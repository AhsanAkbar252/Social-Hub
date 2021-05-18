class GroupsController  < ApplicationController
  before_action :authenticate_user!
  before_action :valid_user, only: [:edit,:update,:destroy]
  def new
    @friends = present_friendships(current_user)
    @group = Group.new
  end

  def create
    @group =  Group.new group_parameters
    if @group.save
      GroupUser.create(group_id: @group.id, user_id: current_user.id) 
      flash[:success] = "Group is Created ssuccessfully"
      redirect_to groups_path
    else
      flash[:danger] = "Group cannot be created"
      render "new"
    end
  end

  def index
    @friends = present_friendships(current_user)
    @groups = Group.all
    if params[:search_name].present?
     @groups = Group.where("lower(group_name) like ?","%#{params[:search_name].downcase}%")
    end
  end

  def show
    @group = Group.find(params[:id])
    @post = Post.new
  end

  def edit
    @friends = present_friendships(current_user)
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    binding.pry
    if @group.update(group_parameters)
      flash[:success] = "Group is Created successfully"
      redirect_to groups_path
    else
      render 'edit'
    end
  end


  def destroy
    @group = Group.find(params[:id])
    @group.posts.each do |post|
      post.comments.each do|comment|
        comment_destructor(comment)
        comment.destroy
      end
      post.destroy
    end

    @group.group_users.each do |group_user|
      group_user.destroy
    end
    @group.destroy
  end


  def comment_destructor(comment)
    if comment.comments == []
      return
    else
      comment.comments.each do|com|
        comment_destructor(com)
        com.destroy
      end
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

  def my_groups
    @my_groups =Array.new
    @group_users = GroupUser.where(user_id: current_user.id)
    @group_users.each do|group_user|
      @my_groups.push(group_user.group)      
    end
    @admin_groups = Group.where(admin_id: current_user.id)
    @friends = present_friendships(current_user)
  end


  def group_parameters
    params.require(:group).permit(:group_name,:admin_name,:cover_photo,:photo,:admin_id)
  end

  def valid_user
    @group = Group.find(params[:id])
    if current_user.id !=  @group.admin_id
      flash[:danger]= "You cannot perform this action"
      redirect_to root_path
    end
  end
end