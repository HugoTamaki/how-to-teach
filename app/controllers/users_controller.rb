class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def my_profile
    @user = User.find(current_user.id)
    search_path params[:search] if params[:search]
  end

  def profile
    @user = User.find(params[:id])
    search_path params[:search] if params[:search]
  end

  private

    def search_path(search)
      @search = User.search(search)
      render "search"
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
