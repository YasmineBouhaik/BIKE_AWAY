class AddReferencesToRide < ActiveRecord::Migration[6.1]
  def change
    add_reference :rides, :itinerary, foreign_key: true
  end
end
