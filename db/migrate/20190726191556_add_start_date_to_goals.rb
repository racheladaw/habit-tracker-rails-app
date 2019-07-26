class AddStartDateToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :start_date, :datetime
    add_column :goals, :days_completed, :integer, :default => 0
  end
end
