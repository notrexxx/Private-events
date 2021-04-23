class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: "user_id"
  validates :date, :name, :description, presence: true
  has_many :registrations
  has_many :attendees, through: :registrations, source: :user
end
