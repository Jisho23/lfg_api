class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users.map{|user| user.package_json}
  end

  def show
    user = User.include(:honors).find(params['id'])
    render json: user.package_json
  end

  def create
     user = User.new(create_user_params)
     if user.valid?
       user.save
       render json: user.package_json
     else
       error = user.errors.full_messages
       render json: {error: error.first}
     end
  end

  def update
    user = User.find(params[:user][:id])
    user.update(update_user_params)
  end

  def addRemoveGame
    to_do = update_game_params
    user = User.find(to_do[:userId])
    game = Game.find(to_do[:gameId])
    if to_do[:performAction] == 'add'
      user.games << game
    else
      user.games = user.games.select{|current_game| current_game.id != game.id}
    end
  end

  def create_user_params
    params.permit(:username, :password, :image)
  end

  def update_user_params
    params.require(:user).permit(:lfg, :image, :status)
  end

  def update_game_params
    params.permit(:userId, :performAction, :gameId)
  end

end
