class CreateUserChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :user_challenges do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.timestamps
    end
  end
end
