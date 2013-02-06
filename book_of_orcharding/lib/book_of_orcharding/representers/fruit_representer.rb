require 'roar/representer/json'
require 'roar/representer/json/hal'
require 'roar/representer/feature/hypermedia'

module FruitOrcharding
  module FruitRepresenter
    include Roar::Representer::JSON::HAL

    property :id
    property :name
    property :taste

    link :self do
      fruit_url(id)
    end
  end
end
