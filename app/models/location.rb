class Location < ApplicationRecord
  has_many :favorites
  has_many :sport_locations
  has_many :users, through: :favorites
  has_many :sports, through: :sport_locations
end
