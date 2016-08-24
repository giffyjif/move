class RemoveLocationIdFromChallenges < ActiveRecord::Migration[5.0]
  def change
    remove_column :challenges, :location_id, :integer
  end
end
