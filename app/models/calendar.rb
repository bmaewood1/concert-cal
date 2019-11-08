class Calendar < ApplicationRecord
    has_many :events, through: :event_calendars
    belongs_to :user

end
