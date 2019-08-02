class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness:true
  validates :name, presence: true

  has_many :goals
  has_many :habits, through: :goals

  def num_of_goals_for_habit(habit)
    goals_for_habit = self.goals.where(habit_id: habit.id)
    goals_for_habit.count
  end

  def unique_habits
    self.habits.uniq { |h| h.name }
  end

end
