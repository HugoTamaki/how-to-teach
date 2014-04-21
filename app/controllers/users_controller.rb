class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def my_profile
    @user = User.find(current_user.id)
    redirect_to search_path if params[:search]
  end

  def profile
    @user = User.find(params[:id])
    @search = User.search(params[:search]) if params[:search]
    render my_profile_path if params[:search]
  end

  def search
    @search = User.search(params[:search]) if params[:search]
  end
end
