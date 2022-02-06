class ChefsEntreesController < ApplicationController
  def index
    chef = Chef.find(params["chef_id"])
    @chef_entrees = chef.entrees
  end
end
