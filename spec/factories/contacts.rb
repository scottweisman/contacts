# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name "John"
    last_name "Smith"
    company "Smith Enterprises"
    email "jsmith@example.com"
    phone "123-456-7890"
    street_address "123 Oakland Dr"
    city "Chicago"
    state "IL"
    zip "60614"
    website "www.smith.com"
    facebook "jsmith"
    twitter "jsmith"
  end
end
