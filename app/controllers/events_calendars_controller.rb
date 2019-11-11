class EventsCalendarsController < ApplicationController

    def create
        @user = User.find(7)
        @calendar = Calendar.find_by(id: @user.calendar.id)
        @event = Event.find(params[:id])
        @eventcalendar = EventCalendar.new(calendar_id: @calendar.id, event_id: @event.id)
        if @eventcalendar.save
            redirect_to calendar_path(@calendar)
        else
            redirect_to events_path
        end
    end

    # private

    # def strong_params
    #     params.require(:eventcalendar).require(:calendar_id, :event_id)
    # end


  end