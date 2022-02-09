class BandMusiciansController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
  end

end
