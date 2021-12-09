class RemoveVoteFromParticipants < ActiveRecord::Migration[6.1]
  def change
    remove_column :participants, :vote, :integer
  end
end
