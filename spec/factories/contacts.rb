# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name "MyString"
    last_name "MyString"
    company "MyString"
    email "MyString"
    phone "MyString"
    street_address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    website "MyString"
    facebook "MyString"
    twitter "MyString"
  end
end
