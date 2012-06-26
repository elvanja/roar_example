require 'roar/representer/feature/client'

class FruitRepresenterClient
  include Roar::Representer::Feature::HttpVerbs

  def initialize
    extend Orcharding::FruitRepresenter
    extend Roar::Representer::Feature::Client
    transport_engine = Roar::Representer::Transport::Faraday
  end

  def represented_fruit
    class << self
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
    self
  end
end

