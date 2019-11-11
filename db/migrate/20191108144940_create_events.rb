class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :artist
      t.string :venue
      t.datetime :date
      t.string :image
      t.string :ticket_url
      t.string :genre

      t.timestamps
    end
  end
end
