class RemoveIdFromLocation < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :user_id, :string
  end
end
