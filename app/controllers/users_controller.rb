class UsersController < ApplicationController
  def my_profile
    @user = User.find(current_user.id)
    @search = User.search(params[:search]) if params[:search]
  end

  def profile
    @user = User.find(params[:id])
  end
end
