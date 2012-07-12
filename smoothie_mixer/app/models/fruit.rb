require 'roar/representer/feature/client'

class Fruit
  include Roar::Representer::Feature::HttpVerbs
  include ActiveAttr::Model

  def initialize(*)
    extend Orcharding::FruitRepresenter
    extend Roar::Representer::Feature::Client
    transport_engine = Roar::Representer::Transport::Faraday
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

