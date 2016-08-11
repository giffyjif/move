class RemoveHomeFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :home_location, :string
  end
end
