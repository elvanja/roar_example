require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module Orcharding
  module FruitRepresenter
    include Roar::Representer::JSON
    include Roar::Representer::Feature::Hypermedia

    #TODO can this be a one liner?
    property :id
    property :name
    property :taste

    link :self do
      #TODO enable links to use serving app routing
      #how do I make representer be in gem and have links like this
      "http://localhost:9292/fruit/#{self.id}"
    end
  end
end
