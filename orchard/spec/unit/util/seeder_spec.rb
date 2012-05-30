require 'spec_helper'

module Orcharding
  describe Seeder do
    it "should load seed data for repositories" do
      data = '[
          {"fruit":[
            {"id": 1, "name": "Apple", "taste": "sweet"},
            {"id": 2, "name": "Banana", "taste": "sweet"}
          ]}
         ]'

      Seeder.load_from_json(data)
      FruitRepository.all.map {|data| data[:id]}.should == [1, 2]
      FruitRepository.all.map {|data| data[:name]}.should == ["Apple", "Banana"]
    end
  end
end
