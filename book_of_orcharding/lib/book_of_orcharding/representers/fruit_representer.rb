require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module Orcharding
  module FruitRepresenter
    include Roar::Representer::JSON::HAL
    include Roar::Representer::Feature::Hypermedia

    property :id
    property :name
    property :taste

    link :self do
      fruit_url(self.id)
    end
  end
end
