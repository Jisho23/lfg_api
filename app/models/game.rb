class Game < ApplicationRecord
  has_many :usergames
  has_many :users, through: :usergames

  validates :name, uniqueness: true
  validates :name, presence: true

  def package_json
    users = self.users.sort{|usera, userb| userb.honors.length <=> usera.honors.length}
    {game: self, users: users}
  end
end
