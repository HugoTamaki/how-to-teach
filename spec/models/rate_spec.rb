require "spec_helper"

describe Rate do
  let(:rate) {FactoryGirl.build(:rate)}

  describe "Attributes" do
    it {should have_attribute :rater_id}
    it {should have_attribute :rateable_id}
    it {should have_attribute :rateable_type}
    it {should have_attribute :stars}
    it {should have_attribute :dimension}
  end

  describe "Relationships" do
    it {should respond_to :rater}
    it {should respond_to :rateable}
  end

  
end