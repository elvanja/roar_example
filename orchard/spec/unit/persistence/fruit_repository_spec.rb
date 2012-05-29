require 'spec_helper'

module Orcharding
  describe FruitRepository do
    before :all do
      FruitRepository.seed = [
        {id: "1", name: "Apple", taste: 'sweet'},
        {id: "2", name: "Lemon", taste: 'sour'},
        {id: "3", name: "Banana", taste: 'sweet'},
        {id: "4", name: "Pineapple", taste: 'sweet'}
      ]
    end

    it "shouldn't find a non existing fruit by id" do
      FruitRepository.find_by_id("100").should == nil
    end

    it "finds fruit by id" do
      hash = FruitRepository.find_by_id("2")
      hash[:id].should == "2"
    end

    it "shouldn't find non existing fruits by taste" do
      FruitRepository.find_by_taste("bad").should == []
    end

    it "finds fruits by taste" do
      array = FruitRepository.find_by_taste("sweet")
      array.size.should == 3
    end

    it "creates a fruit" do
      hash = FruitRepository.create({name: "Hybrid Banana", taste: "bad"})
      hash[:name].should == "Hybrid Banana"
    end

    it "shouldn't update a non existing fruit" do
      hash = FruitRepository.update({id: "100", name: 'Updated Apple'})
      hash.should == nil
      FruitRepository.find_by_id("100").should == nil
    end

    it "updates an existing fruit" do
      hash = FruitRepository.update({id: "3", name: 'Updated Banana'})
      hash[:name].should == "Updated Banana"
      FruitRepository.find_by_id("3")[:name].should == "Updated Banana"
    end

    it "shouldn't destroy a non existing fruit" do
      FruitRepository.destroy("100").should == nil
    end

    it "destroys an existing fruit" do
      FruitRepository.destroy("4")[:id].should == "4"
      FruitRepository.find_by_id("4").should == nil
    end
  end
end
