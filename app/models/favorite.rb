class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :location, optional: true
  belongs_to :sport, optional: true
end
