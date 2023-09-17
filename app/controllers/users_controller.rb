class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def index
    @users = User.all
    @user = current_user 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else 
      render 'edit'
    end 
  end
  
  def follows
   user = User.find(params[:id])
   @users = user.following_users
  end
  
  def followers
   user = User.find(params[:id])
   @user = user.follower_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end 
  end 
end
