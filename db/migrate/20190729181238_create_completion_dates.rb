class CreateCompletionDates < ActiveRecord::Migration[5.2]
  def change
    create_table :completion_dates do |t|
      t.integer :goal_id
      t.datetime :date
      t.timestamps
    end
  end
end
