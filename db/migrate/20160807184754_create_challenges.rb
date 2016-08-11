class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.integer :creator_id
      t.integer :location_id
      t.integer :sport_id
      t.string :text

      t.timestamps
    end
  end
end
