require 'spec_helper'

require_relative '../../lib/book_of_orcharding/representers/fruit_representer'

module FruitOrcharding
  describe FruitRepresenter do
    context "when representing" do
      subject {
        fruit = OpenStruct.new(id: 1, name: "Apple", taste: "sweet")
        fruit.extend(FruitRepresenter)
        fruit.stub(:fruit_url).and_return("http://tutti_frutti/fruits/1")
        fruit
      }

      it "represents fruit properties" do
        representation = %({"id":1, "name":"Apple", "taste":"sweet"})
        expect(subject.to_json).to be_json_eql(representation).excluding("_links")
      end

      it "represents links collection" do
        expect(subject.to_json).to have_json_path("_links")
        expect(subject.to_json).to have_json_type(Hash).at_path("_links")
      end

      it "represents self link" do
        self_representation = %({"href":"http://tutti_frutti/fruits/1"})
        expect(subject.to_json).to be_json_eql(self_representation).at_path("_links/self")
      end
    end

    context "when consuming" do
      pending
    end
  end
end
