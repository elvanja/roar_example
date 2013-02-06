require 'roar/representer/feature/client'
#require 'roar/representer/transport/faraday'

class Fruit < OpenStruct
  #include Roar::Representer::Feature::HttpVerbs
  include ActiveAttr::Model

  def initialize(*)
    extend FruitOrcharding::FruitRepresenter
    extend Roar::Representer::Feature::Client
    #transport_engine = Roar::Representer::Transport::Faraday
    super
  end

  def url
    links[:self].href
  end

  def to_param
    CGI::escape(url)
  end

  def self.from_param(param)
    find_by_id(param)
  end
end
