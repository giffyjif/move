class RenameTextToDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :challenges, :text, :description
  end
end
