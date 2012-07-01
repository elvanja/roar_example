require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

class FruitsController < ApplicationController
  include Roar::Rails::ControllerAdditions
  represents :json, Orcharding::Fruit
  
  def index
    respond_with Orcharding::Fruit.all, represent_with: Orcharding::FruitsRepresenter
  end

  def show
    respond_with Orcharding::Fruit.find_by_id(params[:id])
  end
end
