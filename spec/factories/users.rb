#encoding: UTF-8

FactoryGirl.define do
  factory :user do
    first_name "Hugo"
    last_name "Tamaki"
    email "exemplo@exemplo.com"
    password "11111111"
    password_confirmation "11111111"
  end
end