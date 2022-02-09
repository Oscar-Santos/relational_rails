class BandMusiciansController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @year = params[:filter]
  end

end
