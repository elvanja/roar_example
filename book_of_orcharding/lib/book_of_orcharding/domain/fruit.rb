module Orcharding
  class Fruit
    extend RepositoryFactory
    include HashSerialization

    attr_accessor :id, :name, :taste

    def initialize(params = {})
      from_hash params
    end

    def update(params = {})
      from_hash params.reject {|param, value| [:id].include?(param)}
      self.class.repository.update to_hash
    end

    class << self
      def all
        repository.all.map do |data|
          new_from_hash data
        end
      end

      def find_by_id(id)
        new_from_hash repository.find_by_id(id)
      end

      def find_by_taste(taste)
        repository.find_by_taste(taste).map do |data|
          new_from_hash data
        end
      end

      def create(data)
        new_from_hash repository.create(data)
      end

      def destroy(id)
        repository.destroy(id)
      end
    end
  end
end
