class ChefsEntreesController < ApplicationController
  def index
    Chef.find(params["chef_id"])
    @chef_entrees = chef.entrees
  end
end
