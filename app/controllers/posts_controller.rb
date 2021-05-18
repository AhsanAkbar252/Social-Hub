class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_parameters)
    @post.user_id = current_user.id
    if(@post.save) 
      flash[:success] = "Post is created successfully"
      redirect_to posts_path
    else
      render "new"
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if(@post.update) 
      flash[:success] = "Post is updated successfully"
      redirect_to posts_path
    else
      render "new"
    end

  end

  def timeline
    @room = Room.new 
    @post = Post.new
    @friend_request = FriendRequest.new
    @user = User.find(params[:format])
    @friends = present_friendships(@user)
    @posts = Post.where(user_id: params[:format])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.each do|comment|
      comment_destructor(comment)
      comment.destroy
    end
    @post.destroy
    flash[:danger] = "Post is deleted successfully"
    redirect_to root_path
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



  def index
    @post = Post.new
    @friends = present_friendships(current_user)
    @groups = present_groups(current_user)
    @pages = present_pages(current_user)
    @posts = Post.where(user_id: current_user.id).or(Post.where(user_id: @friends)).or(Post.where(group_id: @groups)).or(Post.where(page_id: @pages))
    

  end

  def present_groups(user)
    groups = Array.new
    user.group_users.each do |group_user|
      groups.push(group_user.group)
    end
    return groups
  end


  def present_pages(user)
    pages = Array.new
    user.page_followers.each do |page_follower|
      pages.push(page_follower.page)
    end
    return pages
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



  def like
    @post = Post.find(params[:id])
    @post.likes = @post.likes.to_i + 1
    @post.save
    redirect_to posts_path
  end

  def dislike
    @post = Post.find(params[:id])
    @post.dislikes = @post.dislikes.to_i + 1
    @post.save
    redirect_to posts_path
  end

   def show
    @post = Post.find(params[:id])
   end

  def permitted_parameters
    params.require(:post).permit(:description,:user_id,:group_id,:page_id,{photos: []},{videos: []})
  end
end