class EventsCalendarsController < ApplicationController

    def create
        @user = current_user
        @calendar = Calendar.find_by(id: @user.calendar.id)
        @event = Event.find(params[:id])
        # make this a validation?
        if EventCalendar.all.include?(EventCalendar.find_by(calendar_id: @calendar.id, event_id: @event.id))
            redirect_to events_path
        else
            @eventcalendar = EventCalendar.create(calendar_id: @calendar.id, event_id: @event.id)
            redirect_to calendar_path(@calendar)
                # if @eventcalendar.save
                    # redirect_to calendar_path(@calendar)
        end
                # else
                #     redirect_to events_path
                # end
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