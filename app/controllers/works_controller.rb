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

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(params[:work].permit(:user_id, :project_id,
                                          :datetimeperformed, :hours))

    if @work.save
      flash[:notice] = 'Work created'
      redirect_to @work
    else
      render 'new'
    end
  end
end
