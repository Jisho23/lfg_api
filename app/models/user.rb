class User < ApplicationRecord
  has_many :usergames
  has_many :games, through: :usergames
  has_many :messages
  has_many :groups, :class_name => 'Group', :foreign_key => 'owner_id', dependent: :destroy
  has_many :invited, :class_name => 'Invite', :foreign_key => 'recipient_id', dependent: :destroy
  has_many :honors, :class_name => 'Honor', :foreign_key => 'honored_id', dependent: :destroy
  has_many :honored, :class_name => 'Honor', :foreign_key => 'honorer_id', dependent: :destroy

  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true

  def package_json
    invites = self.invited.select {|invite| !invite.accept}
    accepted_invites = self.invited.select {|invite| invite.accept}
    {
      user: self,
      invites: invites.map{ |invite|
        {
          invite_id: invite.id,
          group_id: invite.group.id,
          game: invite.group.game,
          sender: invite.sender,

        }
      },
      groups: {
        owner: self.groups.map {|group|
            {
              group_id: group.id,
              game: group.game,
              pending: group.pending_invites.map{|invite| invite.recipient},
              accepted: group.accepted_invites.map{|invite| invite.recipient}
            }
          },
        accepted_invites: accepted_invites.map { |invite|
          {
            group_id: invite.group.id,
            game: invite.group.game,
            sender: invite.sender,
          }
        }
      },
      games: self.games.map{|game| game.id},
      honor: self.honors,
      honored: self.honored
    }
  end


end
