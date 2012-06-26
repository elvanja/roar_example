class FruitsController < ApplicationController
  include Roar::Rails::ControllerAdditions

  def index
    client = FruitsRepresenterClient.new
    client.get("http://localhost:9292/fruits", 'application/json')
    @fruits = client.represented_fruits
  end

  def edit
    client = FruitRepresenterClient.new
    client.get("http://localhost:9292/fruits/#{params[:id]}", 'application/json')
    @fruit = client.represented_fruit
  end
end
