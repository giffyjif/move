class AddLocationToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :location, :string
  end
end
