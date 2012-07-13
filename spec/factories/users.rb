# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password_digest "MyString"
    group_id 1
    invitation_id 1
    admin false
    stripe_customer_token "MyString"
    plan_id 1
  end
end
