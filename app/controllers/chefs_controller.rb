class ChefsController < ApplicationController
  def index
    @chefs = Chef.order_by_creation
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def create
    @chef = Chef.create(chef_params)
    redirect_to '/chefs'
  end

  def new
  end

  private
  def chef_params
    params.permit(:name, :age, :is_male, :years_employed)
  end
end
