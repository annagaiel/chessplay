class OffersController < ApplicationController
  # before_action :authenticate_player!, :only => [:index, :new, :create, :accept_game]


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

  def create_game(white, black)
    g = Game.new
    g.white = white
    g.black = black
    g.save
    g
  end

  def accept_game
    @offer = Offer.includes(:player).find(params[:id])
    @offer_player = @offer.player
    @player_that_accepts_the_offer = current_player
    if @offer.player == current_player
      return render 'index', notice: 'Not Allowed'
    end
    @game = if @offer.play_as == "Random"
      if ["White", "Black"].sample == "White"
        create_game(@offer_player, @player_that_accepts_the_offer)
      else
        create_game(@player_that_accepts_the_offer, @offer_player)
      end
    elsif @offer.play_as == "White"
      create_game(@offer_player, @player_that_accepts_the_offer)
    elsif @offer.play_as == "Black"
      create_game(@player_that_accepts_the_offer, @offer_player)
    end

    if @game.valid?
      @offer.destroy
      redirect_to game_path(@game)
    end

  end

  private

  def offer_params
    params.require(:offer).permit(:days_per_turn, :play_as, :rated)
  end
end
