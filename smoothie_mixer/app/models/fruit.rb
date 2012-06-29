require 'roar/representer/feature/client'

class Fruit
  include Roar::Representer::Feature::HttpVerbs

  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def initialize(*)
    extend Orcharding::FruitRepresenter
    extend Roar::Representer::Feature::Client
    transport_engine = Roar::Representer::Transport::Faraday
    @persisted = true if @persisted.nil?
  end

  def to_param
    id
  end

  def self.from_param(param)
    find_by_id(param)
  end

  def persisted?
    @persisted
  end
  
  def errors
    []
  end
end

