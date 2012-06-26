require 'roar/representer/json'

module Orcharding
  module FruitsRepresenter
    include Roar::Representer::JSON
    include Roar::Representer::Feature::Hypermedia

    collection :fruits, :extend => FruitRepresenter, :class => Fruit

    def fruits
      collect
    end
  end
end
