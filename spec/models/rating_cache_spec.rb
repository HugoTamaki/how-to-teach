require "spec_helper"

describe RatingCache do
  let(:rating_cache) {FactoryGirl.build(:rating_cache)}

  describe "Attributes" do
    it {should have_attribute :cacheable_id}
    it {should have_attribute :cacheable_type}
    it {should have_attribute :avg}
    it {should have_attribute :qty}
    it {should have_attribute :dimension}
  end

  describe "Relationships" do
    it {should respond_to :cacheable}
  end
end