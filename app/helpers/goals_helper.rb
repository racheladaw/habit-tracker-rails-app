module GoalsHelper

  def readable_date(goal)
    goal.start_date.strftime("%B %d, %Y")
  end

end
