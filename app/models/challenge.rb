class Challenge < ApplicationRecord
  belongs_to :sport
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  belongs_to :location
  has_many :user_challenges
  has_many :users, through: :user_challenges
end
