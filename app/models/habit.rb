class Habit < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_many :goals
  has_many :users, through: :goals
end
