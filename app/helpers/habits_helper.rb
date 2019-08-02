module HabitsHelper

  def category_has_popular_habits?(category)
    !category.popular_habits_in_category.empty?
  end

  def category_has_habits?(category)
    !category.habits.empty?
  end

end
