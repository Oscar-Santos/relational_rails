class BandsController < ApplicationController
  def index
    # binding.pry
    # @bands = Band.all.order("updated_at desc")
    @band_names = Band.order("updated_at desc").pluck(:name)
  end

  def show
    @band = Band.find(params[:id])
  end

  # def show_musicians
  #   @band = Band.find(params[:band_id])
  #   @band_musicians = @band.musicians
  # end

end
