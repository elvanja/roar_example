require 'roar/representer/json'

module Orcharding
  module FruitsRepresenter
    include Roar::Representer::JSON
    include Roar::Representer::Feature::Hypermedia

    collection :fruit, :extend => FruitRepresenter, :class => Fruit

    def fruit
      collect
    end
  end
end
