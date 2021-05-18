class FriendshipsController < ApplicationController
  
  # def create
  #   @friendship = Friendship.new permitted_parameters
  #    @friendship.friend_a.friendships.each do|friendship|
  #       if friendship.friend_a == @friendship.friend_b || friendship.friend_b == @friendship.friend_b
  #         flash[:danger] = "Friendship cannot be sent"
  #         redirect_to root_path and return
  #       end
  #    end
  #   if @friendship.save
  #     @friendship.friend_a.friend_requests_as_requestor.each do |friend_request|
  #       if friend_request.receiver = @friendship.friend_b
  #         friend_request.destroy
  #       end
  #     end
  #     @friendship.friend_a.friend_requests_as_receiver.each do |friend_request|
  #       if friend_request.requestor = @friendship.friend_b
  #         friend_request.destroy
  #       end
  #     end
  #     flash[:success] = "Friendship sent successfully"
  #     redirect_to root_path and return
  #   else
  #     flash[:danger] = "Friendship cannot be sent"
  #     redirect_to root_path and return
  #   end

  # end



  def create
    @friendship = Friendship.new permitted_parameters
    friends = present_friendships(@friendship.friend_a)
    if ! (@friendship.friend_b.in? friends) && (@friendship.friend_b != @friendship.friend_a)
      if @friendship.save
        requests = present_friend_requests(@friendship.friend_a,@friendship.friend_b)
        flash[:success] = "Friendship sent successfully"
        redirect_to root_path and return
      else
        flash[:danger] = "Friendship cannot be sent"
        redirect_to root_path and return
      end
    else
      flash[:danger] = "Friendship cannot be sent"
      redirect_to root_path and return
    end


  end



  def present_friend_requests(friend_a,friend_b)
    friend_a.friend_requests.each do|friend_request|
      if friend_request.requestor == friend_b || friend_request.receiver == friend_b
        friend_request.destroy
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

  def index
    @user = User.find(params[:format])
    @friends = present_friendships(@user)
    @friendship = Friendship.new
    @friendshps =Friendship.all
    @friend = User.new
    @friend_requests = FriendRequest.all
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:danger] = "Friendship is deleted successfully"
    redirect_to root_path
  end

  
  def permitted_parameters
    params.require(:friendship).permit(:friend_a_id,:friend_b_id)
  end
end