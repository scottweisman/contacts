# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    recipient_email "MyString"
    sender_id 1
    token "MyString"
  end
end
