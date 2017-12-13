class Game < ApplicationRecord
  has_many :usergames
  has_many :users, through: :usergames

  validates :name, uniqueness: true
  validates :name, presence: true
end
