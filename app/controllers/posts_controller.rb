class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      StatsMix.track("Blog Posts")
      Librato.increment 'posts_created'
      http = Keen.publish_async(:posts)
      http.callback { |response| puts "Success: #{response}"}
      http.errback { puts "was a failurrr :,(" }
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    StatsMix.track("Post Views", 1, options = {})
    Librato.increment 'posts_viewed'
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
