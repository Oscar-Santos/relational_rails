class ChefsController < ApplicationController
  def index
    @chefs = Chef.order_by_creation
  end

  def show
    @chef = Chef.find(params[:id])
  end
end
