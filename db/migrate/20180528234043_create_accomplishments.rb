class CreateAccomplishments < ActiveRecord::Migration[5.2]
  def change
    create_table :accomplishments do |t|
      t.integer :user_id
      t.string :title
      t.string :effect
      t.datetime :date_time

      t.timestamps
    end
  end
end
