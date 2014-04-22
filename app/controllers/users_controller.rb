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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
