module FruitOrcharding
  class Fruit
    extend RepositoryFactory
    include HashSerialization
    extend ActiveModel::Naming # needed for rails in tutti_frutti, should not be here !!!

    attr_accessor :id, :name, :taste

    def initialize(params = {})
      me_from_hash params
    end

    def update(params = {})
      me_from_hash params.reject {|param, value| [:id].include?(param.to_sym)}
      self.class.repository.update me_to_hash
    end

    def create
      me_from_hash(self.class.repository.create(me_to_hash))
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
