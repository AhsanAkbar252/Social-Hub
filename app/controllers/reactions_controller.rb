class ReactionsController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:danger] = "You can't like more than once"
      redirect_to posts_path
    else
      @post.reactions.create(user_id: current_user.id)
      respond_to do |format|
        format.js 
      end
    end
  end


  def find_post
    @post = Post.find(params[:post_id])
  end



  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
      redirect_to posts_path
    else
      @reaction.destroy
      respond_to do |format|
        format.js 
      end
    end
    
  end


  def find_like
   @reaction = @post.reactions.find(params[:id])
  end

  private
  def already_liked?
    Reaction.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end


end
