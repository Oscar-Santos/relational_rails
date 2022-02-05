class BandMusiciansController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @band_musicians = @band.musicians
  end
end
