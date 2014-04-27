class MethodologiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_methodology, only: [:show, :edit, :update, :destroy]

  # GET /methodologies
  # GET /methodologies.json

  def index
    
  end

  # GET /methodologies/1
  # GET /methodologies/1.json
  def show
    @rating = RatingCache.where(cacheable_id: params[:id]).first
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

  private

    def search_path(search)
      @search = User.search(search)
      render "users/search"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_methodology
      @methodology = Methodology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def methodology_params
      params.require(:methodology).permit(:title, :content, :user_id, videos_attributes: [:id, :methodology_id, :legend, :url, :_destroy])
    end
end
