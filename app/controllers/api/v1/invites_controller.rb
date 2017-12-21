class Api::V1::InvitesController < ApplicationController

  def create
    user = User.find_by(username: params[:user])
    sender = User.find(params[:senderId])
    group = Group.find(params[:groupId])
    Invite.create(group: group, sender: sender, recipient: user)
  end

  def update
    invite = Invite.find(params[:inviteId])
    group = invite.group
    if params[:toDo] == 'Accept'
      invite[:accept] = true
      invite.save
      render json: {invite_status: 'Invite Accepted!', group_id: group.id}
    else
      invite.destroy
      render json: {invite_status: 'Invite Rejected!', action: 'reload', group_id: group.id}
    end

  end

end
