class QuizViewLogsController < ApplicationController
  before_action :set_quiz_view_log, only: [:show, :edit, :update, :destroy]

  def index
    @quiz_view_logs = QuizViewLog.all
    respond_with(@quiz_view_logs)
  end

  def show
    respond_with(@quiz_view_log)
  end

  def new
    @quiz_view_log = QuizViewLog.new
    respond_with(@quiz_view_log)
  end

  def edit
  end

  def create
    @quiz_view_log = QuizViewLog.new(quiz_view_log_params)
    @quiz_view_log.save
    respond_with(@quiz_view_log)
  end

  def update
    @quiz_view_log.update(quiz_view_log_params)
    respond_with(@quiz_view_log)
  end

  def destroy
    @quiz_view_log.destroy
    respond_with(@quiz_view_log)
  end

  private
    def set_quiz_view_log
      @quiz_view_log = QuizViewLog.find(params[:id])
    end

    def quiz_view_log_params
      params.require(:quiz_view_log).permit(:quiz_id, :viewer_id)
    end
end
