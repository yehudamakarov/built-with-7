class AddDayToAccomplishments < ActiveRecord::Migration[5.2]
  def change
    add_column :accomplishments, :day, :string
  end
end
