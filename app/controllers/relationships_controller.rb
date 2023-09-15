class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    follow = current_user.follows.new
    follow.user_id = user.id
    follow.save
    redirect_to 'users'
  end

  def destroy
     Follow.find(params[:id]).destroy
    redirect_to user_path(params[:user_id])
  end
end
