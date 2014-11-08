class ResultViewLogsController < ApplicationController
  before_action :set_result_view_log, only: [:show, :edit, :update, :destroy]

  def index
    @result_view_logs = ResultViewLog.all
    respond_with(@result_view_logs)
  end

  def show
    respond_with(@result_view_log)
  end

  def new
    @result_view_log = ResultViewLog.new
    respond_with(@result_view_log)
  end

  def edit
  end

  def create
    @result_view_log = ResultViewLog.new(result_view_log_params)
    @result_view_log.save
    respond_with(@result_view_log)
  end

  def update
    @result_view_log.update(result_view_log_params)
    respond_with(@result_view_log)
  end

  def destroy
    @result_view_log.destroy
    respond_with(@result_view_log)
  end

  private
    def set_result_view_log
      @result_view_log = ResultViewLog.find(params[:id])
    end

    def result_view_log_params
      params.require(:result_view_log).permit(:result_id, :viewer_id)
    end
end
