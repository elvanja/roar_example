# require representers here, since they are not required in gem, see book_of_orcharding/lib/book_of_orcharding.rb
require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

class FruitsController < ApplicationController
  # must be used here, if used in application controller, representers don't work (unless explicit extend is used)
  include Roar::Rails::ControllerAdditions
  represents :json, :entity => FruitOrcharding::FruitRepresenter, :collection => FruitOrcharding::FruitsRepresenter

  def index
    respond_with FruitOrcharding::Fruit.all
  end

  def show
    respond_with FruitOrcharding::Fruit.find_by_id(params[:id])
  end
end
