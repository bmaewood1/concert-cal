class EventCalendar < ApplicationRecord
    belongs_to :calendar, :event
end
