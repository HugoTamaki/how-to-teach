require "spec_helper"

describe User do
  let(:user) {FactoryGirl.build(:user)}

  describe "Attributes" do
    it {should have_attribute :email}
    it {should have_attribute :first_name}
    it {should have_attribute :last_name}
    it {should have_attribute :avatar_file_name}
    it {should have_attribute :avatar_content_type}
    it {should have_attribute :avatar_file_size}
  end

  describe "Relationships" do
    it {should respond_to :methodologies}
    it {should respond_to :friendships}
    it {should respond_to :feeds}
    it {should respond_to :comments}
    it {should respond_to :schools}
  end
end