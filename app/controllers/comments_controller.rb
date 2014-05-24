class CommentsController < ApplicationController
  def create
    @methodology = Methodology.find(params[:methodology_id])
    @comment = @methodology.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      User.post_feed(current_user, "#{current_user.full_name} postou um comentário na metodologia #{@methodology.title}")
      redirect_to methodology_path(@methodology), notice: "Comentário adicionado com sucesso."
    else
      redirect_to methodology_path(@methodology), alert: "Comentário não foi adicionado com sucesso."
    end
    
  end

  def destroy
    @methodology = Methodology.find(params[:methodology_id])
    @comment = @methodology.comments.find(params[:id])
    @comment.destroy
    redirect_to methodology_path(@methodology_path), notice: "Comentário excluído."
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :methodology_id, :content)
    end
end
