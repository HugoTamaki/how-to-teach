class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def my_profile
    search_path params[:search] if params[:search]
    @user = User.find(current_user.id)
    @feeds = @user.feeds.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @friendships = @user.friendships.order(accepted: :asc).paginate(page: params[:page], per_page: 10)
  end

  def profile
    search_path params[:search] if params[:search]
    @user = User.find(params[:id])
    @friendships = @user.friendships.paginate(page: params[:page], per_page: 10)
  end

  def paginate_feeds
    @feeds = current_user.feeds.paginate(page: params[:page], per_page: 10)
    data = []
    @feeds.each do |feed|
      hash = {}
      hash[:id] = feed.user.id
      hash[:name] = feed.user.full_name
      hash[:message] = feed.message
      data << hash
    end
    respond_to do |format|
      format.json { render json: data }
    end
  end

  def paginate_friends
    @friendships = current_user.friendships.paginate(page: params[:page], per_page: 10)
    data = []
    @friendships.each do |friendship|
      hash = {}
      hash[:id] = friendship.id
      hash[:friend_id] = friendship.friend.id
      hash[:name] = friendship.friend.full_name
      data << hash
    end
    respond_to do |format|
      format.json { render json: data }
    end
  end

  private

    def search_path(search)
      @search = User.search(search).paginate(page: params[:page], per_page: 10)
      render "search"
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
