class Goal < ApplicationRecord
  validates :description, presence: true
  validates :start_date, presence: true

  belongs_to :user
  belongs_to :habit
  has_many :completion_dates

  def readable_date
    self.start_date.strftime("%B %d, %Y")
  end

  def completion_percentage
    today = Time.now.to_date
    start = self.start_date.to_date
    elapsed_days = [(today - start).to_i, 1].max
    ((self.days_completed.to_f / elapsed_days) * 100).round(2)
  end

  def days_left_to_form_habit
    66 - self.days_completed
  end

  def goal_completed_today?(date)
    self.completion_dates.each do |completion_date|
      if completion_date.date.to_date == date
        return true
      end
    end
    false
  end

end
