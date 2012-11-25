require 'roar/representer/json'
require 'roar/representer/json/hal'
require 'roar/representer/feature/hypermedia'

module FruitOrcharding
  module FruitsRepresenter
    include Roar::Representer::JSON::HAL
    include Roar::Representer::Feature::Hypermedia

    collection :fruits, :extend => FruitRepresenter, :class => FruitOrcharding::Fruit

    def fruits
      collect
    end
  end
end
