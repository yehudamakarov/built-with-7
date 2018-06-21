class AddHumanTimeToAccomplishments < ActiveRecord::Migration[5.2]
  def change
    add_column :accomplishments, :human_time, :string
  end
end
