module Orcharding
  module HashSerialization
    def self.included(klass)
      klass.class_eval do
        extend ClassMethods
        include InstanceMethods
      end
    end

    module ClassMethods
      def new_from_hash(hash)
        self.new.from_hash hash
      end
    end

    module InstanceMethods
      def from_hash(hash)
        return unless hash
        hash.each do |key, value|
          variable = "@#{key}".to_sym
          self.instance_variable_set(variable, value) and next if self.respond_to?("#{key}=") || self.respond_to?("#{key}")
          self.instance_variable_set(variable, value) if self.instance_variables.include?(variable)
        end
        self
      end

      def to_hash
        hash = {}
        self.instance_variables.each do |variable|
          variable = variable.to_s.gsub('@', '')
          hash[variable.to_sym] = self.send(variable.to_sym) if self.respond_to?(variable)
        end
        hash
      end
    end
  end
end
