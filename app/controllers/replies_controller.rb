class RepliesController < ApplicationController
  
  def new
    @post = current_user.posts.find(params[:post_id])
    @title = @post.title
    @reply = @post.replies.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @reply = Reply.new(reply_params)
    @reply.post = @post
    @reply.user = current_user
    
    if @reply.save
      redirect_to post_path(@post)
    else
      render 'replies#new'
    end
  end
  
  private
  
  def reply_params
    params.require(:reply).permit(:content)
  end
end
