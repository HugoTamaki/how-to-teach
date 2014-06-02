
FactoryGirl.define do
  factory :rate do
    rater_id 1
    rateable_id 1
    rateable_type "Methodology"
    stars 3.0
    dimension "qualidade"
  end
end