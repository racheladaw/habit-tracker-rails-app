class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :habits

  def popular_habits_in_category
    Habit.popular_habits.select { |h| h.category == self }
  end
end
