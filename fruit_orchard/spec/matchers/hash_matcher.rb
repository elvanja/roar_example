module Matchers
  class ObjectToHashMatcher
    def initialize(hash)
      @hash = hash
    end

    def matches?(target)
      @target = target
      @hash.each do |field, expected|
        @field, @expected = field, expected
        @value = target.instance_variable_get("@#{@field}".to_sym)
        return false unless @value == @expected
      end
      true
    end

    def failure_message
      "for #{@field} expected #{@expected}, but got #{@value == nil ? 'nil' : @value}"
    end

    def negative_failure_message
      "for #{@field} expected not to be #{@expected}, but got it anyways"
    end
  end

  def be_equal_to_hash(hash)
    ObjectToHashMatcher.new(hash)
  end
end
