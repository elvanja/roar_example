require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

class FruitsController < ApplicationController
  include Roar::Rails::ControllerAdditions

  def index
    @fruits = Fruits.get("http://localhost:9292/fruits", 'application/json').fruits
  end

  def edit
    @fruit = Fruit.get(params[:id], 'application/json')
  end
end
