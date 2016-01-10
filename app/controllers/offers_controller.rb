class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to offer_path(@offer), notice: "Offer was Saved!"
    else
      flash.now[:alert] = "Offer was not created"
      render 'new'
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  private

  def offer_params
    params.require(:offer).permit(:days_per_turn, :play_as, :rated)
  end
end
