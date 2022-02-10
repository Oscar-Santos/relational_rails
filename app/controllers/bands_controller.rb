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

  def edit
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])
    band.update(band_params)
    redirect_to "/bands/#{params[:id]}"
  end

  def destroy
    band = Band.find(params[:id])
    band.musicians.destroy_all
    band.destroy
    redirect_to '/bands'
  end

  private

    def band_params
      # params.permit(:name, :founded, :genre, :currently_active)

      param_list = []

      param_list << :name unless params[:name] == ""
      param_list << :founded unless params[:founded] == ""
      param_list << :genre unless params[:genre] == ""
      param_list << :currently_active unless params[:currently_active] == ""

      params.permit(param_list)
    end

end
