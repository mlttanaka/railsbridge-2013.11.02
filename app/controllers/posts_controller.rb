class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
