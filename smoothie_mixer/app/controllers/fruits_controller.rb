require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

class FruitsController < ApplicationController
  include Roar::Rails::ControllerAdditions

  def index
    client = FruitsRepresenterClient.new
    client.get("http://localhost:9292/fruits", 'application/json')
    @fruits = client.represented_fruits
  end

  def edit
    @fruit = Fruit.get(params[:id], 'application/json')
  end
end
