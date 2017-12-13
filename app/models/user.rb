class User < ApplicationRecord
  has_many :usergames
  has_many :games, through: :usergames
  has_many :messages
  has_many :groups, :class_name => 'Group', :foreign_key => 'owner_id'
  has_many :invited, :class_name => 'Invite', :foreign_key => 'recipient_id'

  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true

  def package_json
    {
      user: self,
      invites: self.invited.map{ |invite|
        {
          id: invite.id,
          game: invite.group.game,
          group: invite.group,
          sender: invite.sender,

        }
      },
      groups: {
        owner: self.groups.map {|group|
            {
              game: group.game,
              pending: group.pending_invites.map{|invite| invite.recipient},
              accepted: group.accepted_invites.map{|invite| invite.recipient}
            }
          },
        invited: self.invited.map { |invite|
          {
            group_id: invite.group.id,
            game: invite.group.game,
            sender: invite.sender,
          }
        }
      },
      games: self.games
    }
  end

end
