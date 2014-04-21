class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], accepted: false, invited: false)
    @friend_friendship = User.find(params[:friend_id]).friendships.build(friend_id: current_user.id, accepted: false, invited: true)
    if @friendship.save && @friend_friendship.save
      redirect_to my_profile_path, notice: "Convite enviado para o professor."
    else
      redirect_to profile_path(params[:friend_id]), alert: "Não foi possivel adicionar o professor."
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friend_friendship = Friendship.where(user_id: @friendship.friend.id).first
    @friendship.destroy
    @friend_friendship.destroy
    flash[:notice] = "Contato removido."
    redirect_to my_profile_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :accepted, :invited)
  end
end
