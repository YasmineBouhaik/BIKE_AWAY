class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
