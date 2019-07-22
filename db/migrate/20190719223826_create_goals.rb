class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :description
      t.integer :user_id
      t.integer :habit_id

      t.timestamps
    end
  end
end
