require 'spec_helper'

describe FruitsController do
  it "should return json for a single fruit" do
    FruitOrcharding::Fruit.stub(:find_by_id) { FruitOrcharding::Fruit.new({id: 1, name: 'Apple', taste: 'sweet'}) }
    get :show, id: 1, format: :json
    response.body.should == {id: 1, name: 'Apple', taste: 'sweet', _links: {self: {href: 'http://fru.it/fruits/1'}}}.to_json
  end

  it "should return json for fruits collection" do
    FruitOrcharding::Fruit.stub(:all) {[
      FruitOrcharding::Fruit.new({id: 1, name: 'Apple', taste: 'sweet'}),
      FruitOrcharding::Fruit.new({id: 2, name: 'Banana', taste: 'sweet'})
    ]}
    get :index, format: :json
    response.body.should == {fruits: [
      {id: 1, name: 'Apple', taste: 'sweet', _links: {self: {href: 'http://fru.it/fruits/1'}}},
      {id: 2, name: 'Banana', taste: 'sweet', _links: {self: {href: 'http://fru.it/fruits/2'}}}
    ]}.to_json
  end
end
