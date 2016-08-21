class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  has_many :user_challenges
  has_many :sports, through: :favorites
  has_many :locations, through: :favorites
  has_many :challenges, through: :user_challenges

  def full_name
    "#{first_name} #{last_name}"
  end
end
