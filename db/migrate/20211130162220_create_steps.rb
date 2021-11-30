class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :address
      t.decimal :longitude
      t.decimal :latitude
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
