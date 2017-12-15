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
    byebug
  end
end
