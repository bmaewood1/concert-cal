class EventCalendar < ApplicationRecord
    belongs_to :calendar
    belongs_to :event

    validates :calendar_id, uniqueness: { scope: :event_id }


    def start_time
        self.event.date.rfc2822.slice(0, self.event.date.rfc2822.length-15) ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
end
