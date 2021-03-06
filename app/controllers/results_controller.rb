class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:evaluate]
  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @quizzes = Quiz.all
   
  end

  # GET /results/new
  def new
    @quizzes = Quiz.all
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
    @quizzes = Quiz.all
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)
    @quizzes = Quiz.all
    respond_to do |format|
      if @result.save
        format.html { redirect_to results_path, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  def evaluate
    selected_options = params[:option_selected]
    quiz = Quiz.find(params[:quiz_id])
    results = quiz.results    
    result_count = {}
    results.each do |result|
      result_count[result.id] = 0
    end
    if current_viewer
        QuizViewLog.create(quiz_id: quiz.id, viewer_id: current_viewer.id, status: "submitted")
    end
    selected_options.each do |question_id,option_id|
      selected_option = Option.find(option_id)
      result_count[selected_option.result_id] = result_count[selected_option.result_id] + 1
      if current_viewer
        OptionSelectLog.create(option_id: option_id, viewer_id: current_viewer.id)
      end
    end
    result = Result.find(result_count.max_by{|k,v| v}.first)
    if current_viewer
        ResultViewLog.create(result_id: result.id, viewer_id: current_viewer.id)
    end
    result_to_return = {"title"=> result.title,
                        "result_prefix" => quiz.result_prefix,
                        "description"=> result.description,
                        "image_url"=> result.image.url(:small)}
    render json: result_to_return
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    @quizzes = Quiz.all
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to results_path, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params 
      params.require(:result).permit(:title, :description, :viewings, :image, :quiz_id)
    end
end
