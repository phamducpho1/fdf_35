FactoryGirl.define do
  factory :user do
    name "phopham"
    password "123123123"
    password_confirmation "123123123"
    admin 1
    email "pha@gmail.com"
    address "cc"
  end
end
