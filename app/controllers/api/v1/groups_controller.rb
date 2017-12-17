class Api::V1::GroupsController < ApplicationController
  def index
    groups = Group.all
    render json: groups.to_json()
  end

  def show
    group = Group.find(params['id']).package_json
    render json: group.to_json()
  end

  def create
    newGroup = Group.new(game_id: params[:gameId], owner_id: params[:userId])
    user = User.find(params[:userId])
    params[:gamers].each do |user_id|
      recipient = User.find(user_id)
      invite = Invite.create(group: newGroup, sender: user, recipient: recipient)
    end
    if newGroup.valid?
      group = group.package_json
      render json: newGroup.to_json()
    else
      render json: {error: "There was a problem creating this group. Please Try again"}.to_json()
    end
  end

  def create_group_params
    params.permit('')
  end
end
