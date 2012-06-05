class FruitController < ApplicationController
  include Roar::Rails::ControllerAdditions
  respond_to :json

  def index
    respond_with Orcharding::Fruit.all, with_representer: Orcharding::FruitsRepresenter
  end

  def show
    respond_with Orcharding::Fruit.find_by_id(params[:id]), with_representer: Orcharding::FruitRepresenter
  end
end
