class CommentsController < ApplicationController
before_action :find_commentable, only: :create

    def new
      @comment = Comment.new
    end

    def create
      @commentable.comments.build(comment_params)
      binding.pry
      @commentable.save
      respond_to do |format|
        format.js 
      end
      
    end

    private

    def comment_params
      params.require(:comment).permit(:content,:user_id)
    end

    def find_commentable
      if params[:comment_id]
        @commentable = Comment.find_by_id(params[:comment_id]) 
      elsif params[:post_id]
        @commentable = Post.find_by_id(params[:post_id])
      end
    end

end