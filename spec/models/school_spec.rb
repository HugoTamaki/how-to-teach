require "spec_helper"

describe School do
  let(:school) {FactoryGirl.build(:school)}

  describe "Attributes" do
    it {should have_attribute :user_id}
    it {should have_attribute :name}
  end

  describe "Relationships" do
    it {should respond_to :user}
  end

  describe "Validation" do
    describe "of attributes" do
      describe "#name" do
        context "is valid" do
          it "when it has a name" do
            school.name = "C.E. Machado de Assis"
            school.should have(0).errors_on :name
          end
        end

        context "is invalid" do
          it "when it has no name" do
            school.name = ""
            school.should_not have(0).errors_on :name
          end
        end
      end
    end
  end
end