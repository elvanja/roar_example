require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

class FruitsController < ApplicationController
  include Roar::Rails::ControllerAdditions

  def index
    @fruits = Fruits.get("http://localhost:9292/fruits", 'application/json').fruits
  end

  def edit
    # id is actually url of the resource/fruit, see app/models/fruit
    @fruit = Fruit.get(params[:id], 'application/json')
  end

  def new
    @fruit = Fruit.new
  end

  # TODO: finish up posting, is fruit posting itself, or to fruits collection?
  def create
    fruit = Fruit.new(params[:fruit])
    #fruits = Fruits.get("http://localhost:9292/fruits", 'application/json').fruits
    #fruits << fruit

    fruit.post("http://localhost:9292/fruits", 'application/json')
    #fruits.post(fruits.links[:self])
    redirect_to fruits_path, notice: "May you have a mouthfull of #{fruit.name}"
  end
end
