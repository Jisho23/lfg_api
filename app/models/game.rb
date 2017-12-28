class Game < ApplicationRecord
  has_many :usergames
  has_many :users, through: :usergames

  validates :name, uniqueness: true
  validates :name, presence: true

  def package_json
    users = self.users.sort{|usera, userb| userb.honors.length <=> usera.honors.length}
    users.map! do |user|
      {
        id: user.id,
        username: user.username,
        status: user.status,
        honor: user.honors.length,
        image: user.image,
        lfg: user.lfg,
        honor: user.honors.length
      }
    end
    {game: self, users: users}
  end
end
