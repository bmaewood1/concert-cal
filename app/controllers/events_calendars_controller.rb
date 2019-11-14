class EventsCalendarsController < ApplicationController

    def create
        @user = current_user
        @calendar = Calendar.find_by(id: @user.calendar.id)
        @event = Event.find(params[:id])
        @eventcalendar = EventCalendar.new(calendar_id: @calendar.id, event_id: @event.id)
        if @eventcalendar.save
            redirect_to calendar_path(@calendar)
        else
            flash.alert = ["This event is already on your Concert Cal"]
            redirect_to events_path
        end
    end

    def destroy
        @user = current_user
        @calendar = Calendar.find_by(id: @user.calendar.id)
        @event = Event.find(params[:id])
        @eventcalendar = EventCalendar.find_by(calendar_id: @calendar.id, event_id: @event.id)
        @eventcalendar.destroy
        redirect_to calendar_path(@calendar)
    end


  end