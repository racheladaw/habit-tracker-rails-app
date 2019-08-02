class Goal < ApplicationRecord
  validates :description, presence: true
  validates :start_date, presence: true

  belongs_to :user
  belongs_to :habit
  has_many :completion_dates, :dependent => :destroy

  def goal_completed_today?(date)
    self.completion_dates.each do |completion_date|
      if completion_date.date.localtime.to_date == date
        return true
      end
    end
    false
  end

  def complete_goal_today
    self.update(days_completed: self.days_completed += 1)
    completion_date = CompletionDate.new(date: Time.now.localtime)
    self.completion_dates << completion_date
  end

  def start_date_in_future?
    self.start_date.to_date > Time.now.localtime.to_date
  end

  def goal_finished?
    self.days_completed >= 66
  end 

end
