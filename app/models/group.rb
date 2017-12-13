class Group < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :game
  has_many :invites
  has_many :recipients, through: :invites
  has_many :messages

  def accepted_invites
    self.invites.select {|invite| invite.accept}
  end

  def pending_invites
    self.invites.select {|invite| !invite.accept}
  end

  def package_json
    {
      id: self.id,
      game: self.game,
      owner: self.owner,
      members: self.accepted_invites.map {|invite| invite.recipient},
      pending: self.pending_invites.map {|invite| invite.recipient}
    }
  end

end
