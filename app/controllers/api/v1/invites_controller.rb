class Api::V1::InvitesController < ApplicationController

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
