class RemoveIdFromSport < ActiveRecord::Migration[5.0]
  def change
    remove_column :sports, :user_id, :string
  end
end
