if Rails.env.development?
  Group.destroy_all
  User.destroy_all
  Contact.destroy_all
  Plan.destroy_all

  group = Group.create!(name: "LaunchPad Labs")
  user = User.create!(full_name: "Scott Weisman", email: "sweisman@example.com", password: "password", group_id: group.id, admin: true)
  
  
  25.times do 
    company = Faker::Company.name
    group.contacts.create!( first_name: Faker::Name.first_name, 
                              last_name: Faker::Name.last_name,
                              company: company,
                              email: Faker::Internet.email,
                              phone: Faker::PhoneNumber.phone_number,
                              street_address: Faker::Address.street_address,
                              city: Faker::Address.city,
                              state: Faker::Address.us_state_abbr,
                              zip: Faker::Address.zip_code,
                              website: "www.#{company}.com",
                              facebook: "#{company}",
                              twitter: "#{company}"
                            )
    end 
    
  Plan.create!(:name => "Startup", :price => 7.99)
  Plan.create!(:name => "Enterprise", :price => 12.99)
  
  puts "Development database ready for use."
else
  puts "Do not run this in production!"
end
