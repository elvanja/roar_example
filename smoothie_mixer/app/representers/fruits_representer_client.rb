require 'roar/representer/feature/client'

class FruitsRepresenterClient
  include Roar::Representer::Feature::HttpVerbs

  def initialize
    extend Orcharding::FruitsRepresenter
    extend Roar::Representer::Feature::Client
    transport_engine = Roar::Representer::Transport::Faraday
  end

  def represented_fruits
    fruits.each do |fruit|
      class << fruit
        extend ActiveModel::Naming
        include ActiveModel::Conversion

        attr_accessor :persisted

        def initialize(*)
          super
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
      end
    end
  end
end

