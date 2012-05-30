require 'spec_helper'

module Orcharding
  describe Fruit do
    let (:repository) { mock }

    before :each do
      Fruit.repository = repository
    end

    def assert_fruits(fruits, fruits_array)
      fruits.size.should == fruits_array.size
      fruits.each_index { |i| fruits[i].should be_equal_to_hash(fruits_array[i]) }
    end

    context "finding fruits" do
      it "finds all fruit" do
        fruits_array = [
          {id: 1, name: 'Apple', taste: 'sweet'},
          {id: 2, name: 'Banana', taste: 'sweet'},
          {id: 3, name: 'Pineapple', taste: 'sweet'}
        ]
        repository.should_receive(:all).and_return(fruits_array)
        assert_fruits Fruit.all, fruits_array
      end

      it "finds by id" do
        fruit_hash = {id: 100, name: 'Apple', taste: 'sweet'}
        repository.should_receive(:find_by_id).with(100).and_return(fruit_hash)
        Fruit.find_by_id(100).should be_equal_to_hash(fruit_hash)
      end

      it "finds a single fruit by taste" do
        fruits_array = [{id: 100, name: 'Apple', taste: 'sweet'}]
        repository.should_receive(:find_by_taste).with('sweet').and_return(fruits_array)
        assert_fruits Fruit.find_by_taste('sweet'), fruits_array
      end

      it "finds a list of fruit by taste" do
        fruits_array = [
          {id: 1, name: 'Apple', taste: 'sweet'},
          {id: 2, name: 'Banana', taste: 'sweet'},
          {id: 3, name: 'Pineapple', taste: 'sweet'}
        ]
        repository.should_receive(:find_by_taste).with('sweet').and_return(fruits_array)
        assert_fruits Fruit.find_by_taste('sweet'), fruits_array
      end
    end

    context "creating new fruit" do
      it "creates a new fruit" do
        data_hash = {name: 'Hybrid Apple from Hell', taste: 'bad'}
        fruit_hash = data_hash.merge({id: 100})
        repository.should_receive(:create).with(data_hash).and_return(fruit_hash)
        Fruit.create(data_hash).should be_equal_to_hash(fruit_hash)
      end
    end

    context "updating fruit" do
      it "updates an existing fruit" do
        data_hash = {name: 'Apple', taste: 'sweet'}
        fruit_hash = data_hash.merge({id: 100})
        update_hash = {id: 101, name: 'Updated Apple'}
        repository.should_receive(:update).with(fruit_hash.merge(update_hash.reject{|key, value| key == :id}))
        fruit = Fruit.new(fruit_hash)
        fruit.update(update_hash)
        fruit.name.should == 'Updated Apple'
      end
    end

    context "destroying a fruit" do
      it "should destroy an existing fruit" do
        repository.should_receive(:destroy).with(74)
        Fruit.destroy(74)
      end
    end
  end
end
