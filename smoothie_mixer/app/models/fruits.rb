require 'roar/representer/feature/client'

class Fruits < OpenStruct
  include Roar::Representer::Feature::HttpVerbs

  def initialize
    extend Orcharding::FruitsRepresenter
    extend Roar::Representer::Feature::Client
    transport_engine = Roar::Representer::Transport::Faraday
  end
end

