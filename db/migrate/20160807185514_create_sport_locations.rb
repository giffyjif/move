class CreateSportLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :sport_locations do |t|
      t.integer :location_id
      t.integer :sport_id
      t.timestamps
    end
  end
end
