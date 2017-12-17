class Api::V1::InvitesController < ApplicationController
  def update
    invite = Invite.find(params[:inviteId])
    if params[:toDo] == 'Accept'
      invite[:accept] = true
      invite.save
      render json: {invite_status: 'Invite Accepted!'}
    else
      invite.destroy
      render json: {invite_status: 'Invite Rejected!'}
    end

  end

end
