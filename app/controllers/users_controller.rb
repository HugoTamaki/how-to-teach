class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def my_profile
    @user = User.find(current_user.id)
    @search = User.search(params[:search]) if params[:search]
    render "search" if params[:search]
  end

  def profile
    @user = User.find(params[:id])
    @search = User.search(params[:search]) if params[:search]
    render "search" if params[:search]
  end

  def search
    
  end

  def accept
    @friendship = Friendship.find(params[:id])
    @friend_friendship = Friendship.where(user_id: params[:friend_id]).first
    @friendship.accepted = true
    @friend_friendship.accepted = true
    if @friendship.save && @friend_friendship.save
        redirect_to my_profile_path, notice: "Amigo aceito com sucesso."
      else
        redirect_to my_profile_path, alert: "Não foi possível aceitar o amigo."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
