class AddCommentsToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :comment, :text
  end
end
