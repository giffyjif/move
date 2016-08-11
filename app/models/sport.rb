class Sport < ApplicationRecord
  has_many :sport_locations
  has_many :challenges
  has_many :favorites
  has_many :users, through: :favorites
  has_many :locations, through: :sport_locations
end
