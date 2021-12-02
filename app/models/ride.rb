class Ride < ApplicationRecord
  belongs_to :itinerary
  has_many :participants, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :participants

  validates :date, presence: true
end
