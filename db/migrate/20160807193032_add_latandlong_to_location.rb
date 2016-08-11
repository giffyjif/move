class AddLatandlongToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :latitude, :string
    add_column :locations, :longitude, :string
  end
end
