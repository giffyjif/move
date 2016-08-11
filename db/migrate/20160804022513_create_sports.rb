class CreateSports < ActiveRecord::Migration[5.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
