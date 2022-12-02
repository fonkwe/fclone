class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @friend_ids = current_user.friends.map(&:id)
    @friend_ids << current_user.id # include current_user id to friend ids
    @our_posts = Post.where(user_id: @friend_ids)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
 def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def destroy; end
  
  private
  
  def posts_params
    params.require(:post).permit(:content, :imageURL)
  end
end
