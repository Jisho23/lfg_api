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
    accepted_invites = self.accepted_invites
    accepted_invites.map! {|invite| {invite_id: invite.id, recipient: invite.recipient}}
    pending_invites = self.pending_invites.map! {|invite| {invite_id: invite.id, recipient: invite.recipient}}
    {
      id: self.id,
      game: self.game,
      owner: self.owner,
      members: accepted_invites,
      pending: pending_invites
    }
  end

end
