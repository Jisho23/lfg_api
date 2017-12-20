class Api::V1::HonorsController < ApplicationController

  def index
    honors = Honor.all
    render json: honors.to_json
  end

  def handle_honor
    honorer = User.find(params[:honorer])
    honored = User.find(params[:honored])
    if params[:toDo] == 'honor'
      newHonor = Honor.create(honorer: honorer, honored: honored)
      render json: newHonor.to_json
    else
      honor = Honor.find_by(honorer_id: params[:honorer], honored_id: params[:honored])
      honor.destroy
      render json: {message: 'Successfully unhonored'}.to_json
    end
  end
end
