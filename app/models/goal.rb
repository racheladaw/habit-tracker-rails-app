class Goal < ApplicationRecord
  validates :description, presence: true
  
  belongs_to :user
  belongs_to :habit
end
