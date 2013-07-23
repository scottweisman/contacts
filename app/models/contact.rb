class Contact < ActiveRecord::Base
  attr_accessible :city, :company, :email, :linkedin, :first_name, :last_name, :phone, :state, :street_address, :twitter,
                  :website, :zip, :notes_attributes

  validates_presence_of :first_name, :last_name

  belongs_to :group
  belongs_to :user
  has_many :notes, :dependent => :destroy
  accepts_nested_attributes_for :notes, :allow_destroy => true

  comma do
    first_name
    last_name
    company
    email
    phone
    street_address
    city
    state
    zip
    website
    linkedin
    twitter
  end


end
