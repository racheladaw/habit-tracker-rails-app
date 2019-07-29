class AddDatesCompletedToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :dates_completed, :datetime
  end
end
