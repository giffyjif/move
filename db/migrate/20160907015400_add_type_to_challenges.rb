class AddTypeToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :type, :string
  end
end
