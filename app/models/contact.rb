class Contact < ActiveRecord::Base
  attr_accessible :city, :company, :email, :linkedin, :first_name, :last_name, :phone, :state, :street_address, :twitter,
                  :website, :zip, :notes_attributes, :personal_email, :title, :cell

  include PgSearch

  validates_presence_of :first_name, :last_name

  belongs_to :group
  belongs_to :user
  has_many :notes, :dependent => :destroy
  has_many :tags, :through => :descriptors
  has_many :descriptors, :dependent => :destroy
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



  belongs_to :cracker
  has_many :cheeses, :through => :cracker

  pg_search_scope :tag_search, :associated_against => {
    :tags => [:name]
  }
  pg_search_scope :search_by_contact_info, :against => [:first_name, :last_name, :company, :title]

end
