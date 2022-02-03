class EntreesController < ApplicationController
  def index
    @entrees = Entree.all
  end
end
