class Participant < ApplicationRecord
  belongs_to :ride
  belongs_to :user
  validates :ride, uniqueness: { scope: :user }
end
