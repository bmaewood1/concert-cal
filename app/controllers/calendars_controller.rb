require 'byebug'

class CalendarsController < ApplicationController
  def show
    @calendar = Calendar.find(params[:id])
    @my_events = EventCalendar.all.select do |event_cal|
      event_cal.calendar.id == @calendar.id

    end

  end
end
