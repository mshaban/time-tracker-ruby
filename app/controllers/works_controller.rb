class WorksController < ApplicationController
  def index
    if params[:days]
      @works = Work.recent_days(params[:days]).order('datetimeperformed desc')
    else
      @works = Work.all.order('datetimeperformed desc')
    end
  end

  def show
    @work = Work.find(params[:id])
  end
end
