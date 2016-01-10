class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params[:offer_params])
    if @offer.save
      redirect_to offers_path
    else
      render 'new'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:days_per_turn, :play_as, :rated)
  end
end
