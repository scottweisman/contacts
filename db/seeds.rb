if Rails.env.development?
  Contact.destroy_all
  
  
  #put seed data here  

 puts "Development database ready for use."
else
  puts "Do not run this in production!"
end
