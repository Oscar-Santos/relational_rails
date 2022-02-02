class EntreeController < ApplicationController

  def index
    @entrees = Entree.all
  end
end
