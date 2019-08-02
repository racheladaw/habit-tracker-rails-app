module GoalsHelper

  def readable_date(goal)
    goal.start_date.strftime("%B %d, %Y")
  end

  def completion_percentage(goal)
    today = Time.now.localtime.to_date
    start = goal.start_date.to_date
    elapsed_days = [(today - start + 1).to_i, 1].max
    [((goal.days_completed.to_f / elapsed_days) * 100), 100].min.round(2)
  end

end
