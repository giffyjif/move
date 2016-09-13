class AddChallengeIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :challenge_id, :integer
  end
end
