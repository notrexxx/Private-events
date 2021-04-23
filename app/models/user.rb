class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }
  has_many :events, inverse_of: :creator
  has_many :registrations
  has_many :attended_events, through: :registrations, source: :event
end
