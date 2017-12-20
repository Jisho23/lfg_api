class Api::V1::GamesController < ApplicationController

  def index
    games = Game.all
    render json: games.to_json()
  end

  def show
    game = Game.includes(:users).find(params['id'])
    render json: game.package_json.to_json()
  end
end
