class ViewersController < ApplicationController
  before_action :set_viewer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:create]

  # GET /viewers
  # GET /viewers.json
  def index
    @viewers = Viewer.all
  end

  # GET /viewers/1
  # GET /viewers/1.json
  def show
  end

  # GET /viewers/new
  def new
    @viewer = Viewer.new
  end

  # GET /viewers/1/edit
  def edit
  end

  # POST /viewers
  # POST /viewers.json
  def create
    if current_viewer.present?   
      @viewer = current_viewer   
      @viewer.update(viewer_params)
    else
      @viewer = Viewer.new(viewer_params)
    end

    respond_to do |format|
      if @viewer.save
        session[:viewer_secret] = @viewer.secret
        cookies.permanent.signed[:viewer_secret] = @viewer.secret
        format.html { redirect_to @viewer, notice: 'Viewer was successfully created.' }
        format.json { render :show, status: :created, location: @viewer }
      else
        format.html { render :new }
        format.json { render json: @viewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viewers/1
  # PATCH/PUT /viewers/1.json
  def update
    respond_to do |format|
      if @viewer.update(viewer_params)
        format.html { redirect_to @viewer, notice: 'Viewer was successfully updated.' }
        format.json { render :show, status: :ok, location: @viewer }
      else
        format.html { render :edit }
        format.json { render json: @viewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viewers/1
  # DELETE /viewers/1.json
  def destroy
    @viewer.destroy
    respond_to do |format|
      format.html { redirect_to viewers_url, notice: 'Viewer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viewer
      @viewer = Viewer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viewer_params
      params.require(:viewer).permit(:name, :quizzes_viewed, :questions_viewed, :secret)
    end
end
