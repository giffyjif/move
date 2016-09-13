class AddLatToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :lat, :float
  end
end
