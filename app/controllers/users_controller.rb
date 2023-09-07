class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to '/books'
    else 
      render 'users/edit'
    end 
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end
end
