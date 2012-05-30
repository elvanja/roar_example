class FruitController < ApplicationController
  include Roar::Rails::ControllerAdditions
  respond_to :json

  def index
    respond_with Orcharding::Fruit.all, with_representer: Orcharding::FruitsRepresenter
  end
end
