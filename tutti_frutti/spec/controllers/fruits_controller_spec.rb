require 'spec_helper'

describe FruitsController do
  include Roar::Rails::TestCase

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

  describe "POST" do
    it "creates a new fruit" do
      post :create, {name: 'Mango'}.to_json, format: :json
      fruit = assigns[:fruit]
      #response.should redirect_to("http://fru.it/fruits/1")
      # TODO: shouldn't we be redirected to the new URL?
      response.body.should == "{\"id\":\"#{fruit.id}\",\"name\":\"Mango\",\"_links\":{\"self\":{\"href\":\"http://fru.it/fruits/#{fruit.id}\"}}}"
    end
  end
end
