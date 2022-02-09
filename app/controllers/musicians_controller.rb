class MusiciansController < ApplicationController
  def index
    # @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def new
    @band = Band.find(params[:id])
  end

  def create
    band = Band.find(params[:id])
    band.musicians.create!(musician_params)
    redirect_to "/bands/#{band.id}/musicians"
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    musician = Musician.find(params[:id])
    musician.update(musician_params)
    redirect_to "/musicians/#{params[:id]}"
  end

  def destroy
    Musician.find(params[:id]).destroy
    redirect_to '/musicians'
  end

  private

    def musician_params
      param_list = []

      param_list << :name unless params[:name] == ""
      param_list << :instrument unless params[:instrument] == ""
      param_list << :founding_member unless params[:founding_member] == ""
      param_list << :born unless params[:born] == ""

      params.permit(param_list)
    end
end
