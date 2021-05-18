class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_user, only: [:edit,:update,:destroy]
  def new
    @friends = present_friendships(current_user)
    @page = Page.new
  end

  def create
    @page =  Page.new page_parameters
    if @page.save
      PageFollower.create(page_id: @page.id, user_id: current_user.id) 
      flash[:success] = "Page is Created ssuccessfully"
      redirect_to pages_path
    else
      flash[:danger] = "Page cannot be created"
      render "new"
    end
  end

  def index
    @friends = present_friendships(current_user)
    @pages = Page.all
    if params[:search_name].present?
     @pages = Page.where("lower(page_name) like ?","%#{params[:search_name].downcase}%")
    end
  end

  def show
    @page = Page.find(params[:id])
    @post = Post.new
  end

  def edit
    @friends = present_friendships(current_user)
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    binding.pry
    if @page.update(page_parameters)
      flash[:success] = "Page is Updated successfully"
      redirect_to pages_path
    else
      render 'edit'
    end
  end


  def destroy
    @page = Page.find(params[:id])
    @page.posts.each do |post|
      post.comments.each do|comment|
        comment_destructor(comment)
        comment.destroy
      end
      post.destroy
    end

    @page.page_followers.each do |page_follower|
      page_follower.destroy
    end
    @page.destroy
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

  def my_pages
    @my_pages =Array.new
    @page_followers = PageFollower.where(user_id: current_user.id)
    @page_followers.each do|page_follower|
      @my_pages.push(page_follower.page)      
    end
    # @my_groups = Group.where(admin_id: current_user.id)
    @friends = present_friendships(current_user)
  end
  
  def page_parameters
    params.require(:page).permit(:page_name,:sub_title,:page_email,:page_phone_no,:page_city,:page_country,
                                  :page_description,:page_facebook,:page_twitter,:page_google_plus,:page_instagram,
                                  :admin_name,:admin_id,:photo,:cover_photo,:privacy,:visibility)
  end

  def valid_user
    @page = Page.find(params[:id])
    if current_user.id !=  @page.admin_id
      flash[:danger]= "You cannot perform this action"
      redirect_to root_path
    end
  end

end