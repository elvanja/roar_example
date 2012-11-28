require 'spec_helper'

# TODO see if there is a way to decouple representer from Fruit class
Fruit = Struct.new(:id, :name, :taste) do
  def fruit_url(id)
    "http://tutti_frutti/fruits/#{id}"
  end
end

require_relative '../../lib/book_of_orcharding/representers/fruits_representer'

module FruitOrcharding
  describe FruitRepresenter do
    context "when representing" do
      subject {
        fruits = []
        fruits << Fruit.new(1, "Apple", "sweet")
        fruits << Fruit.new(2, "Lemon", "sour")
        fruits.extend(FruitsRepresenter)
      }

      it "represents fruits collection" do
        expect(subject.to_json).to have_json_path("fruits")
        expect(subject.to_json).to have_json_type(Array).at_path("fruits")
        expect(subject.to_json).to have_json_size(2).at_path("fruits")
      end

      it "contains fruit in collection" do
        fruit_representation = %({"id":1, "name": "Apple", "taste": "sweet"})
        expect(subject.to_json).to be_json_eql(fruit_representation).at_path("fruits/0").excluding("_links")
      end
    end

    context "when consuming" do
      pending
    end
  end
end
