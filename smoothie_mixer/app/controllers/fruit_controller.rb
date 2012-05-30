class FruitController < ApplicationController
  def index
    client = FruitsRepresenterClient.new
    client.get("http://localhost:9292/fruit", 'application/json')
    @fruit = client.represented_fruit
  end
end
