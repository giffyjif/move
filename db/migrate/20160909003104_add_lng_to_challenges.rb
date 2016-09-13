class AddLngToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :lng, :float
  end
end
