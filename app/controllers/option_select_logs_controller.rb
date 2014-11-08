class OptionSelectLogsController < ApplicationController
  before_action :set_option_select_log, only: [:show, :edit, :update, :destroy]

  def index
    @option_select_logs = OptionSelectLog.all
    
  end

  def show
    
  end

  def new
    @option_select_log = OptionSelectLog.new
    
  end

  def edit
  end

  def create
    @option_select_log = OptionSelectLog.new(option_select_log_params)
    @option_select_log.save
    
  end

  def update
    @option_select_log.update(option_select_log_params)
    
  end

  def destroy
    @option_select_log.destroy
    
  end

  private
    def set_option_select_log
      @option_select_log = OptionSelectLog.find(params[:id])
    end

    def option_select_log_params
      params.require(:option_select_log).permit(:option_id, :viewer_id)
    end
end
