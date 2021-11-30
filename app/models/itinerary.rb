class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :rides, dependent: :destroy
end
