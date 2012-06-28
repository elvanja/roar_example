require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module Orcharding
  module FruitRepresenter
    include Roar::Representer::JSON::HAL

    #TODO can this be a one liner?
    property :id
    property :name
    property :taste

    link :self do
      fruit_url(self.id)
    end
  end
end
