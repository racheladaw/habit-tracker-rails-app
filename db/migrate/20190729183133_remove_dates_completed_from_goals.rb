class RemoveDatesCompletedFromGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :dates_completed
  end
end
