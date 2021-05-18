class FriendRequestsController < ApplicationController

  # def create
  #   @friend_request = FriendRequest.new permitted_parameters
  #   if @friend_request.receiver == current_user
  #     flash[:danger] = "Invalid Action"
  #     redirect_to root_path and return
  #   end
  #   @friend_request.receiver.friend_requests_as_receiver.each do |request|
  #     if request.requestor == @friend_request.requestor
  #       flash[:danger] = "You have already sent friend request to this person"
  #       redirect_to root_path and return
  #     end
  #   end
  #   if @friend_request.save
  #     flash[:success] = "Friend request sent successfully"
  #     redirect_to root_path
  #   else
  #     flash[:danger] = "Friend request cannot be sent"
  #     redirect_to root_path
  #   end
  # end


  def create
    @friend_request = FriendRequest.new permitted_parameters
    requests = present_friend_requests(@friend_request.requestor)
    friends = present_friendships(@friend_request.requestor)
    if ! (@friend_request.receiver.in? requests) && (@friend_request.receiver != @friend_request.requestor) && !(@friend_request.receiver.in? friends)
      if @friend_request.save
        flash[:success] = "Friend request sent successfully"
        redirect_to users_path
      else
        flash[:danger] = "Friend request cannot be sent"
        redirect_to users_path
      end
    else
      flash[:danger] = "Friend request cannot be sent"
      redirect_to users_path
    end
  end


  def present_friend_requests(user)
    requests = Array.new
    user.friend_requests.each do|friend_request|
      if friend_request.requestor != user
        requests.push(friend_request.requestor)
      elsif friend_request.receiver != user
        requests.push(friend_request.receiver)
      end         
    end
    return requests
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

  def index
    redirect_to friendships_path(params[:format])
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
    flash[:danger] = "FriendRequest is deleted successfully"
    redirect_to friendships_path(current_user.id)
  end


  def permitted_parameters
    params.require(:friend_request).permit(:requestor_id,:receiver_id)
  end
end