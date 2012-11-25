require 'roar/representer/feature/client'

class Fruit
  include Roar::Representer::Feature::HttpVerbs

  def initialize(*)
    extend FruitOrcharding::FruitRepresenter
    extend Roar::Representer::Feature::Client
    transport_engine = Roar::Representer::Transport::Faraday
  end
end

