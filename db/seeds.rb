if Rails.env.development?
  Contact.destroy_all
  
  25.times { Contact.create!( first_name: Faker::Name.first_name, 
                              last_name: Faker::Name.last_name,
                              company: Faker::Company.catch_phrase,
                              email: Faker::Internet.email,
                              phone: Faker::PhoneNumber.phone_number,
                              street_address: Faker::Address.street_address,
                              city: Faker::Address.city,
                              state: Faker::Address.us_state_abbr,
                              zip: Faker::Address.zip_code,
                              website: Faker::Internet.domain_name,
                              facebook: "facebook.com/#{Faker::Company.catch_phrase}",
                              twitter: "twitter.com/#{Faker::Company.catch_phrase}"
                            )} 

 puts "Development database ready for use."
else
  puts "Do not run this in production!"
end
