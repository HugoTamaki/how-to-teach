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

  describe "Validations" do
    describe "of attributes" do
      describe "#avatar" do
        context "is valid" do
          it "when avatar type is jpg" do
            user.avatar_content_type = "image/jpg"
            user.should have(0).errors_on :avatar_content_type
          end

          it "when avatar type is gif" do
            user.avatar_content_type = "image/gif"
            user.should have(0).errors_on :avatar_content_type
          end

          it "when avatar type is png" do
            user.avatar_content_type = "image/png"
            user.should have(0).errors_on :avatar_content_type
          end

          it "has size between 0 and 200 KB" do
            user.avatar_file_size = 150.kilobytes
            user.should have(0).errors_on :avatar_file_size
          end
        end

        context "is invalid" do
          it "when avatar type is of other type" do
            user.avatar_content_type = "avatar/pdf"
            user.should_not have(0).errors_on :avatar_content_type
          end

          it "when avatar size is greater than 300 KB" do
            user.avatar_file_size = 400.kilobytes
            user.should_not have(0).errors_on :avatar_file_size
          end
        end
      end
    end
  end
end