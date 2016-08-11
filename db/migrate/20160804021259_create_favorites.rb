class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :location_id
      t.integer :sport_id

      t.timestamps
    end
  end
end
