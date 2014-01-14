# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mailchimp do
    list_name "MyString"
    list_id "MyString"
    group_id 1
    tag_id 1
  end
end
