require 'roar/representer/json'
require 'roar/representer/json/hal'
require 'roar/representer/feature/hypermedia'

module FruitOrcharding
  module FruitsRepresenter
    include Roar::Representer::JSON::HAL
    include Roar::Representer::Feature::Hypermedia

    # don't explicitly use FruitOrcharding::Fruit, the target class may be from the client namespace
    # see fruit models and fruits controller in smoothie_mixer
    # TODO see if there is a way to decouple representer from Fruit class
    collection :fruits, :extend => FruitRepresenter, :class => Fruit

    def fruits
      collect
    end
  end
end
