class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :artist
      t.string :venue
      t.string :date

      t.timestamps
    end
  end
end
