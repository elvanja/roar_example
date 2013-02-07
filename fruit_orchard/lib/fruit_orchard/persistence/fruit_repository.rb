module FruitOrcharding
  class FruitRepository
    class << self
      KEYGEN_DATA = [('0'..'9'), ('a'..'z'), ('A'..'Z')].map {|chars| chars.to_a}.flatten

      def seed=(data)
        @seed = data
      end

      def all
        @seed ||= []
      end

      def find_by_id(id)
        all.find {|fruit| fruit[:id] == id}
      end

      def find_by_taste(taste)
        all.select {|fruit| fruit[:taste] == taste}
      end

      def create(data)
        data = HashUtils.symbolize_keys(data)
        data[:id] = (0..10).map {KEYGEN_DATA[rand(KEYGEN_DATA.length)]}.join
        all << data
        data
      end

      def update(data)
        data = HashUtils.symbolize_keys(data)
        fruit = find_by_id(data[:id])
        fruit.update(data) and return fruit if fruit
        nil
      end

      def destroy(id)
        all.delete find_by_id(id)
      end
    end
  end
end
