class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:edit, :update]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show

  end

  def education_posts
    @posts = Post.where(category: "education")
    render "index"
  end

  def other_posts
    @posts = Post.where(category: "other")
    render "index"
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      redirect_to @post
      flash[:notice] = "Your post was added successfully."
    else
      render "new"
      flash[:notice] = "Your post was unable to add. Please check for errors."
    end
  end

  def edit
    if @post.user_id == current_user.id
      render "edit"
    else
      return false
    end
  end

  def update
    if @post.user_id == current_user.id 
      if @post.update post_params
        redirect_to @post
        flash[:notice] = "Your post was updated successfully."
      else
        render "edit"
        flash[:notice] = "Your post was unable to update."
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def authorize_user
    @post = Post.find(params[:id])
    if session[:user_id] == @post.user_id
      return true
    else
      redirect_to root_path
    end
  end


end
