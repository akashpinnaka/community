class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]
  before_action :check_role, only: [:new, :create]


  def index
    @users = User.all.order("created_at DESC")
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "#{@user.name} was added successfully."
      redirect_to @user
    else      
      flash[:notice] = "Unable to add the person. Please check for errors."
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:notice] = "#{@user.name} was updated successfully."
      redirect_to @user      
    else      
      flash[:notice] = "Unable to <update></update> the person. Please check for errors."
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :role, :details, :name, :party, :password, :password_confirmation, :profile_picture)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def check_role
    if session[:role] == "admin"
      return true
    else
      redirect_to root_path
    end
  end

end
