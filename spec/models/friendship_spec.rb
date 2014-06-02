require "spec_helper"

describe Friendship do
  let(:friendship) {FactoryGirl.build(:friendship)}

  describe "Attributes" do
    it {should have_attribute :user_id}
    it {should have_attribute :friend_id}
    it {should have_attribute :accepted}
    it {should have_attribute :invited}
  end

  describe "Relationships" do
    it {should respond_to :user}
  end

  describe "Validations" do
    describe "of attributes" do
      describe "#user_id" do
        context "is valid" do
          it "when it has different ids" do
            friendship.user_id = 1
            friendship.friend_id = 2
            friendship.should have(0).errors_on :friend_id
          end
        end

        context "is invalid" do
          it "when it has same ids" do
            friendship.user_id = 1
            friendship.friend_id = 1
            friendship.should_not have(0).errors_on :friend_id
          end
        end
      end
    end
  end
end