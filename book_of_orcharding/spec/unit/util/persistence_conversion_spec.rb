require 'spec_helper'

module Orcharding
  describe HashSerialization do
    context "create object from hash for a given class" do
      class Test
        include HashSerialization
        attr_reader :key
        attr_accessor :id, :name

        def initialize
          @description = ''
        end

        def descr
          @description
        end
      end

      context "serialization" do
        it "creates with all fields present in hash" do
          hash = {id: 1, name: 'test'}

          target = Test.new_from_hash(hash)
          target.id.should == 1
          target.name.should == 'test'
        end

        it "skips surplus fields present in hash" do
          hash = {id: 1, name: 'test', surplus: 'present'}

          target = Test.new_from_hash(hash)
          target.id.should == 1
          target.name.should == 'test'
          lambda{target.surplus}.should raise_error
        end

        it "returns nil for empty source" do
          hash = nil

          target = Test.new_from_hash(hash)
          target.should == nil
        end

        it "heeds fields with reader accessors" do
          hash = {id: 1, name: 'test', key: 'key'}

          target = Test.new_from_hash(hash)
          target.key.should == 'key'
        end

        it "heeds fields without accessors" do
          hash = {id: 1, name: 'test', description: 'description'}

          target = Test.new_from_hash(hash)
          target.descr.should == 'description'
        end
      end

      context "deserialization" do
        it "returns object as hash" do
          test = Test.new
          test.id = 100
          test.name = 'test'

          test.to_hash.should == {id: 100, name: 'test'}
        end
      end
    end
  end
end
