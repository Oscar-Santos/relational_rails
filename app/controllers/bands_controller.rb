class BandsController < ApplicationController
  def index
  end

  def show
    @band = Band.find(params[:id])
    @member_count = Musician.where(band_id: params[:id]).count
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
