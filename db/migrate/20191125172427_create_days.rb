class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.string :weekday
      t.time :opening_hours
      t.time :closing_hours
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
