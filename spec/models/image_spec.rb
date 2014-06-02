require "spec_helper"

describe Image do
  let(:image) {FactoryGirl.build(:image)}

  describe "Attributes" do
    it {should have_attribute :methodology_id}
    it {should have_attribute :image_file_name}
    it {should have_attribute :image_content_type}
    it {should have_attribute :image_file_size}
    it {should have_attribute :legend}
  end

  describe "Relationships" do
    it {should respond_to :methodology}
  end

  describe "Validations" do
    describe "of attributes" do
      context "is valid" do
        it "when image type is jpeg" do
          image.image_content_type = "image/jpeg"
          image.should have(0).errors_on :image_content_type
        end

        it "when image type is jpg" do
          image.image_content_type = "image/jpg"
          image.should have(0).errors_on :image_content_type
        end

        it "when image type is jpeg" do
          image.image_content_type = "image/gif"
          image.should have(0).errors_on :image_content_type
        end

        it "when image type is jpeg" do
          image.image_content_type = "image/png"
          image.should have(0).errors_on :image_content_type
        end

        it "has size between 0 and 300 KB" do
          image.image_file_size = 200.kilobytes
          image.should have(0).errors_on :image_file_size
        end
      end

      context "is invalid" do
        it "when image type is of other type" do
          image.image_content_type = "image/pdf"
          image.should_not have(0).errors_on :image_content_type
        end

        it "when image size is greater than 300 KB" do
          image.image_file_size = 400.kilobytes
          image.should_not have(0).errors_on :image_file_size
        end
      end
    end
  end
end