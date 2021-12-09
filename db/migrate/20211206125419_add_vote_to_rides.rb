class AddVoteToRides < ActiveRecord::Migration[6.1]
  def change
    add_column :rides, :vote, :integer
  end
end
