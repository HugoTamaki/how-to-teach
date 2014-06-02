require "spec_helper"

describe Methodology do
  let(:methodology) { FactoryGirl.build(:methodology) }

  describe "Attributes" do
    it {should have_attribute :title }
    it {should have_attribute :teaser}
    it {should have_attribute :content}
    it {should have_attribute :user_id}
  end

  describe "Relationships" do
    it {should respond_to :user}
    it {should respond_to :comments}
    it {should respond_to :videos}
    it {should respond_to :images}
    it {should respond_to :qualidade_rates}
  end

  describe "Validations" do
    describe "of attributes" do
      describe "#title" do
        context "is valid" do
          it "when it has a title" do
            methodology.title = "Titulo"
            methodology.should have(0).errors_on :title
          end
        end

        context "is invalid" do
          it "when it has no title" do
            methodology.title = ""
            methodology.should_not have(0).errors_on :title
          end
        end
      end

      describe "#teaser" do
        context "is valid" do
          it "when it has a teaser" do
            methodology.teaser = "Resumo"
            methodology.should have(0).errors_on :teaser
          end
        end

        context "is invalid" do
          it "when it has no teaser" do
            methodology.teaser = ""
            methodology.should_not have(0).errors_on :teaser
          end
        end
      end

      describe "#content" do
        context "is valid" do
          it "when it has a content" do
            methodology.content = "Conteudo"
            methodology.should have(0).errors_on :content
          end
        end

        context "is invalid" do
          it "when it has no content" do
            methodology.content = ""
            methodology.should_not have(0).errors_on :content
          end
        end
      end
    end
  end

end