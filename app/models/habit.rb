class Habit < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_many :goals
  has_many :users, through: :goals

  def self.popular_habits
    self.all.select { |h| h.users.count > 0 }
  end

end
