class OffersController < ApplicationController

  def index
    @offers = Offer.includes(:player).all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.player = current_player
    if @offer.save
      redirect_to offer_path(@offer), notice: "Offer was Saved!"
    else
      flash.now[:alert] = "Offer was not created"
      render 'new'
    end
  end

  def show
    @offer = Offer.includes(:player).find(params[:id])
  end

  def accept_game
    @offer = Offer.includes(:player).find(params[:id])
    @offer_player = @offer.player
    @player_that_accepts_the_offer = current_player
    @game = Game.create()
    if @offer.play_as == "Random"
      if ["White", "Black"].sample == "White"
        @game.update_attributes(white_player: @offer_player.id, black_player: @player_that_accepts_the_offer.id)
      else
        @game.update_attributes(white_player: @player_that_accepts_the_offer.id, black_player: @offer_player.id)
      end
    elsif @offer.play_as == "White"
      @game.update_attributes(white_player: @offer_player.id, black_player: @player_that_accepts_the_offer.id)
    elsif @offer.play_as == "Black"
      @game.update_attributes(white_player: @player_that_accepts_the_offer.id, black_player: @offer_player.id)
    end

    @offer.destroy
    redirect_to game_path(@game)
  end

  private

  def offer_params
    params.require(:offer).permit(:days_per_turn, :play_as, :rated)
  end
end
