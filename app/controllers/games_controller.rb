class GamesController < ApplicationController

  def index
    @games = Game.includes(:player).all
  end

  def show
    @game = Game.find(params[:id])
    @black_player = Player.find_by(id: @game.black_player)
    @white_player = Player.find_by(id: @game.white_player)
  end

end
