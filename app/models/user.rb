class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness:true
  validates :name, presence: true

  has_many :goals
  has_many :habits, through: :goals
end
