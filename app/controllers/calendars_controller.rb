class CalendarsController < ApplicationController
  before_action :authorized, only: [:calendar]

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create(cal_params)
    if @calendar.save
      redirect_to calendar_path(@calendar)
    else
      redirect_to login_path
    end 
  end

  def show
    @calendar = Calendar.find(params[:id])
    @my_events = EventCalendar.all.select do |event_cal|
      event_cal.calendar.id == @calendar.id
    end
  end

  

  private

  def cal_params
    params.require(:calendar).permit(:user_id)
  end
end
