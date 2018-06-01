class CreateDayAccomplishments < ActiveRecord::Migration[5.2]
  def change
    create_table :day_accomplishments do |t|
      t.integer :day_id
      t.integer :accomplishment_id

      t.timestamps
    end
  end
end
