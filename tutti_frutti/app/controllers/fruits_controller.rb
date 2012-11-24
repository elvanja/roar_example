require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

class FruitsController < ApplicationController
  # must be used here, if used in application controller, representers don't work (unless explicit extend is used)
  include Roar::Rails::ControllerAdditions
  represents :json, :entity => Orcharding::FruitRepresenter, :collection => Orcharding::FruitsRepresenter

  def index
    respond_with Orcharding::Fruit.all
  end

  def show
    respond_with Orcharding::Fruit.find_by_id(params[:id])
  end
end