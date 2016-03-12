class SessionsController < ApplicationController

  # before_action :check_login, only: [:new, :create]

  def new
    
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:role] = @user.role
      flash[:notice] = "You are successfully logged in."
      redirect_to root_path      
    else
      flash[:notice] = "Something is preventing you from logging in. Please check your login details."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "You are successfully logged out."
  end

  private

  def check_login
    if session[:user_id].present?
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

end
