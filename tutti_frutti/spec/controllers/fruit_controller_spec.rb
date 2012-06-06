require 'spec_helper'

describe FruitController do
  it "should return json for a single fruit" do
    Orcharding::Fruit.stub(:find_by_id) { Orcharding::Fruit.new({id: 1, name: 'Apple', taste: 'sweet'}) }
    get :show, id: 1, format: :json
    response.body.should == {id: 1, name: 'Apple', taste: 'sweet', links: [{rel: 'self', href: 'http://localhost:9292/fruit/1'}]}.to_json
  end
end
