class Contact < ActiveRecord::Base
  attr_accessible :city, :company, :email, :facebook, :first_name, :last_name, :phone, :state, :street_address, :twitter, 
                  :website, :zip, :notes_attributes
  
  validates_presence_of :first_name, :last_name                
  
  has_many :notes, :dependent => :destroy
  accepts_nested_attributes_for :notes, :allow_destroy => true
end
