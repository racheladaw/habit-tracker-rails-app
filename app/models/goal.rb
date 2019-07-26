class Goal < ApplicationRecord
  validates :description, presence: true
  validates :start_date, presence: true

  belongs_to :user
  belongs_to :habit

  def readable_date
    self.start_date.strftime("%B %d, %Y")
  end

  def completion_percentage

  end 
end
