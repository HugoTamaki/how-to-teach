class MethodologiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_methodology, only: [:show, :edit, :update, :destroy]

  # GET /methodologies
  # GET /methodologies.json

  # GET /methodologies/1
  # GET /methodologies/1.json
  def show
    methodology = Methodology.find(params[:id])
    @comments = methodology.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    search_path params[:search] if params[:search]
  end

  # GET /methodologies/new
  def new
    @methodology = Methodology.new
    search_path params[:search] if params[:search]
  end

  # GET /methodologies/1/edit
  def edit
    search_path params[:search] if params[:search]
  end

  # POST /methodologies
  # POST /methodologies.json
  def create
    @methodology = Methodology.new(methodology_params)

    respond_to do |format|
      if @methodology.save
        User.post_feed(current_user, "#{current_user.full_name} criou uma metodologia - #{@methodology.title}")
        format.html { redirect_to my_profile_path, notice: 'Metodologia criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @methodology }
      else
        format.html { render action: 'new' }
        format.json { render json: @methodology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /methodologies/1
  # PATCH/PUT /methodologies/1.json
  def update
    respond_to do |format|
      if @methodology.update(methodology_params)
        User.post_feed(current_user, "#{current_user.full_name} editou uma metodologia - #{@methodology.title}")
        format.html { redirect_to @methodology, notice: 'Metodologia atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @methodology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /methodologies/1
  # DELETE /methodologies/1.json
  def destroy
    @methodology.destroy
    respond_to do |format|
      format.html { redirect_to my_profile_path, notice: 'Metodologia apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  def paginate_comments
    @comments = Methodology.find(params[:id]).comments.paginate(page: params[:page], per_page: 5)
    data = []
    @comments.each do |comment|
      hash = {}
      hash[:image_path] = view_context.image_tag comment.user.avatar(:search_thumb)
      hash[:user_name] = comment.user.full_name
      hash[:time] = comment.created_at.strftime("%d/%m/%Y - %H:%M")
      hash[:content] = comment.content.gsub(/\n/, '<br/>').html_safe
      data << hash
    end
    respond_to do |format|
      format.json { render json: data }
    end
  end

  private

    def search_path(search)
      @search = User.search(search).paginate(page: params[:page], per_page: 10)
      render "users/search"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_methodology
      @methodology = Methodology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def methodology_params
      params.require(:methodology).permit(:title, :content, :teaser, :user_id, :image, images_attributes: [:id, :methodology_id, :legend, :image, :_destroy], videos_attributes: [:id, :methodology_id, :legend, :url, :_destroy])
    end
end
