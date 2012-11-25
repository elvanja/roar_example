require "json"

module FruitOrcharding
  class Seeder
    def self.load_from_json(json)
      JSON.load(json).each do |data|
        data.each do |fruit_type, seed|
          seed.map! do |data|
            data.inject({}) {|memo, (k,v)| memo[k.to_sym] = v; memo}
          end
          FruitRepository.seed = seed if fruit_type == "fruit"
        end
      end
    end
  end
end
