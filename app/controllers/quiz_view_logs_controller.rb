class QuizViewLogsController < ApplicationController
  before_action :set_quiz_view_log, only: [:show, :edit, :update, :destroy]

  def index
    @quiz_view_logs = QuizViewLog.all
    
  end

  def show
    
  end

  def new
    @quiz_view_log = QuizViewLog.new
    
  end

  def edit
  end

  def create
    @quiz_view_log = QuizViewLog.new(quiz_view_log_params)
    @quiz_view_log.save
    
  end

  def update
    @quiz_view_log.update(quiz_view_log_params)
    
  end

  def destroy
    @quiz_view_log.destroy
    
  end

  private
    def set_quiz_view_log
      @quiz_view_log = QuizViewLog.find(params[:id])
    end

    def quiz_view_log_params
      params.require(:quiz_view_log).permit(:quiz_id, :viewer_id)
    end
end
