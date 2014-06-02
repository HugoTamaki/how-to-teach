require "spec_helper"

describe Comment do
  let(:comment) {FactoryGirl.build(:comment)}

  describe "Attributes" do
    it {should have_attribute :user_id}
    it {should have_attribute :methodology_id}
    it {should have_attribute :content}
  end

  describe "Relationships" do
    it {should respond_to :user}
    it {should respond_to :methodology}
  end

  describe "Validations" do
    describe "of attributes" do
      describe "#content" do
        context "is valid" do
          it "when it has a content" do
            comment.content = "comentário"
            comment.should have(0).errors_on :content 
          end
        end

        context "is invalid" do
          it "when it has no content" do
            comment.content = ""
            comment.should_not have(0).errors_on :content
          end
        end
      end
    end
  end
  
end