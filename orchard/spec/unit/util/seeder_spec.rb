require 'spec_helper'

module Orcharding
  describe Seeder do
    it "should load seed data for repositories" do
      data = '[
          {"fruit":[
            {"id": 1, "name": "Golden Delishes", "taste": "sweet", "fruit_type_id": 1},
            {"id": 2, "name": "Bad Banana", "taste": "sweet", "fruit_type_id": 2}
          ]}
         ]'

      Seeder.load_from_json(data)
      FruitRepository.all.map {|data| data[:id]}.should == [1, 2]
      FruitRepository.all.map {|data| data[:fruit_type_id]}.should == [1, 2]
    end
  end
end
