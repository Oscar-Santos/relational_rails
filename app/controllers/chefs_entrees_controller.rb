# class ChefsEntreesController < ApplicationController
#   def index
#     Chef.find(params[:id])
#     chef_entrees = @chef.entrees
#   end
# end









class ChefsEntreesController < ApplicationController
  def index
    chef = Chef.find(params["chef_id"])

    @chef_entrees = chef.entrees
  end
end
