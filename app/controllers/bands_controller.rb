class BandsController < ApplicationController
  def index
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
  end

  def create
    band = Band.create(band_params)
    redirect_to "/bands"
  end

  private

    def band_params
      params.permit(:name, :founded, :genre, :currently_active)
    end

end
