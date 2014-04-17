class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to my_profile_path, notice: "Amigo adicionado com sucesso!"
    else
      redirect_to profile_path(params[:friend_id]), alert: "Não foi possivel adicionar o amigo."
      # flash[:error] = "Não foi possivel adicionar o amigo"
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
