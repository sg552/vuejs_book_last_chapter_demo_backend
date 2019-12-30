class Monitor::LogsController < ApplicationController

  def index
    @logs = Log.order('created_at desc').page(params[:page]).per(100)
  end
end
