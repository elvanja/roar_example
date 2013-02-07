module FruitOrcharding
  module HashUtils
    def self.symbolize_keys(hash = {})
      symbolized = hash.dup
      symbolized.keys.each do |key|
        symbolized[(key.to_sym rescue key) || key] = symbolized.delete(key)
      end
      symbolized
    end
  end
end
