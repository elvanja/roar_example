require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

class FruitsController < ApplicationController
  include Roar::Rails::ControllerAdditions

  def index
    @fruits = Fruits.get("http://localhost:9292/fruits", 'application/json').fruits
    #@fruits = Fruit.get("http://localhost:9292/fruits/2", 'application/json')
    puts "===================="
    @fruits
  end

  def edit
    @fruit = Fruit.get(params[:id], 'application/json')
  end

  def new
    @fruit = Fruit.new
  end

  # TODO: finish up posting, is fruit posting itself, or to fruits collection?
  def create
    fruit = Fruit.new(params)
    fruits = Fruits.get("http://localhost:9292/fruits", 'application/json').fruits
    fruits << fruit
    #fruits.post(fruits.links[:self])
    redirect_to fruits_path, notice: "May you have a mouthfull of #{fruit.name}"
  end
end
