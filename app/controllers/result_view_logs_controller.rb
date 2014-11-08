class ResultViewLogsController < ApplicationController
  before_action :set_result_view_log, only: [:show, :edit, :update, :destroy]

  def index
    @result_view_logs = ResultViewLog.all
    
  end

  def show
    
  end

  def new
    @result_view_log = ResultViewLog.new
    
  end

  def edit
  end

  def create
    @result_view_log = ResultViewLog.new(result_view_log_params)
    @result_view_log.save
    
  end

  def update
    @result_view_log.update(result_view_log_params)
    
  end

  def destroy
    @result_view_log.destroy
    
  end

  private
    def set_result_view_log
      @result_view_log = ResultViewLog.find(params[:id])
    end

    def result_view_log_params
      params.require(:result_view_log).permit(:result_id, :viewer_id)
    end
end
