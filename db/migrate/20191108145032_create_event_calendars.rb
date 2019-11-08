class CreateEventCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :event_calendars do |t|
      t.integer :calendar_id
      t.integer :event_id

      t.timestamps
    end
  end
end
