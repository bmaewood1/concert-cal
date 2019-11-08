class Event < ApplicationRecord
    belongs_to :calendar, through: :event_calendar

end
