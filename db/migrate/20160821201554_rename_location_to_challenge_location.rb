class RenameLocationToChallengeLocation < ActiveRecord::Migration[5.0]
  def change
    rename_column :challenges, :location, :challenge_location
  end
end
