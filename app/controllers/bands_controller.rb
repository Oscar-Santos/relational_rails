class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def show_musicians
    @band = Band.find(params[:band_id])
    @band_musicians = @band.musicians
  end

end
