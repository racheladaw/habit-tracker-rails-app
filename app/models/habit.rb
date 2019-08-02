class Habit < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_many :goals
  has_many :users, through: :goals

  def self.popular_habits
    select { |h| h.users.count >= 5 }
  end

end
