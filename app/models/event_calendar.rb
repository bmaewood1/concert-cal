class EventCalendar < ApplicationRecord
    belongs_to :calendar
    belongs_to :event
end
