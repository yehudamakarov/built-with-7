class CreateAccomplishments < ActiveRecord::Migration[5.2]
  def change
    create_table :accomplishments do |t|
      t.string :title
      t.string :description
      t.datetime :time
      t.integer :user_id
      t.integer :day_id

      t.timestamps
    end
  end
end
