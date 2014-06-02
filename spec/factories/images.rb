
FactoryGirl.define do
  factory :image do
    methodology_id 1
    image_file_name "imagem.jpg"
    image_content_type "image/jpeg"
    image_file_size 41942
    legend "legenda da imagem"
  end
end