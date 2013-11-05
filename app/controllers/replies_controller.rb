class RepliesController < ApplicationController
  
  def new
    @post = current_user.posts.find(params[:post_id])
    @title ||= @post.title
    @reply = @post.replies.build
  end
  
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new(reply_params)
    @reply.user_id = current_user.id
    @reply.save
    
    if @reply.save
      redirect_to post_path(@post)
    else
      @title = @post.title
      render 'new'
    end
  end
  
  
  private
  
  def reply_params
    params.require(:reply).permit(:content)
  end
end
