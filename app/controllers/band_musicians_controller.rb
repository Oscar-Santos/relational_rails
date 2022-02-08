class BandMusiciansController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
  end

  def new
    @band = Band.find(params[:id])
  end

  def create
    band = Band.find(params[:id])
    band.musicians.create!(musician_params)
    redirect_to "/bands/#{band.id}/musicians"
  end

  private

    def musician_params
      param_list = []

      param_list << :name unless params[:name] == ""
      param_list << :instrument unless params[:founded] == ""
      param_list << :founding_member unless params[:genre] == ""
      param_list << :born unless params[:currently_active] == ""

      params.permit(param_list)
    end
end
