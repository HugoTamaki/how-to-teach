require "spec_helper"

describe Feed do
  let(:feed) {FactoryGirl.build(:feed)}

  describe "Attributes" do
    it {should have_attribute :user_id}
    it {should have_attribute :message}
  end

  describe "Relationships" do
    it {should respond_to :user}
  end
end