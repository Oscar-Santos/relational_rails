class EntreesController < ApplicationController
  def index
    @entrees = Entree.all
  end

  def show
    @entree = Entree.find(params[:id])

  end
end
