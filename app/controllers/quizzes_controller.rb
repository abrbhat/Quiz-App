class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :check_if_new_viewer, only:[:show]
  skip_before_action :authenticate_user!, only: [:show, :list]
  def list
    @quizzes = Quiz.all.reverse
  end
  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @questions = @quiz.questions
    @results = @quiz.results
    if current_viewer
        QuizViewLog.create(quiz_id: @quiz.id, viewer_id: current_viewer.id, status: "viewed")
    end
    unless @quiz.is_live? or (@quiz.is_preview? and user_signed_in?)
      render text: "Nothing here"
    end

  end 

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    #@result = @quiz.result.build()
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quizzes_path, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete_create_form
    @quiz = Quiz.new
    3.times do
      @quiz.results.build
    end
    7.times do
      @quiz.questions.build
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quizzes_path, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:title, :view_count, :image, :description, :result_prefix, :status, :results_attributes => [:id, :title, :description, :image ], :questions_attributes => [:id, :title])
    end

    def check_if_new_viewer
      if !cookies[:viewer_secret]
        viewer = Viewer.new
        viewer.save
        session[:viewer_secret] = viewer.secret
        cookies.permanent.signed[:viewer_secret] = viewer.secret
      end
    end
end
