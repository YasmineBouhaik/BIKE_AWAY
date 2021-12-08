class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :rides, dependent: :destroy

  validates :title, presence: true
  validates :km, presence: true
  validates :category, presence: true, inclusion: { in: ["family", "road bike", "mountain bike"] }
  validates :description, presence: true

  CATEGORIES = ["family", "road bike", "mountain bike"]
end
