
FactoryGirl.define do
  factory :rating_cache do
    cacheable_id 1
    cacheable_type "Methodology"
    avg 3.5
    qty 4
    dimension "qualidade"
  end
end