class Contact < ActiveRecord::Base
  attr_accessible :city, :company, :email, :facebook, :first_name, :last_name, :phone, :state, :street_address, :twitter, :website, :zip
  has_many :notes
end
