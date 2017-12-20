class Game < ApplicationRecord
  has_many :usergames
  has_many :users, through: :usergames

  validates :name, uniqueness: true
  validates :name, presence: true

  def package_json
    users = self.users.sort{|user| user.honors.length}
    {game: self, users: users}
  end
end
