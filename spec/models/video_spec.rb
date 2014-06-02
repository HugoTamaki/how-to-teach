require "spec_helper"

describe Video do
  let(:video) {FactoryGirl.build(:video)}

  describe "Attributes" do
    it {should have_attribute :methodology_id}
    it {should have_attribute :url}
    it {should have_attribute :legend}
  end

  describe "Relationships" do
    it {should respond_to :methodology}
  end
end