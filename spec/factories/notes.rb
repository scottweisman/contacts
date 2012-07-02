# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    content "MyString"
    contacts_id 1
  end
end
