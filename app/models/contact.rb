class Contact < ActiveRecord::Base
  attr_accessible :city, :company, :email, :linkedin, :first_name, :last_name, :phone, :state, :street_address, :twitter,
                  :website, :zip, :notes_attributes, :personal_email, :title, :cell, :tags_attributes

  include PgSearch

  validates_presence_of :first_name, :last_name

  belongs_to :group
  belongs_to :user
  has_many :notes, :dependent => :destroy
  has_many :tags, :through => :descriptors
  has_many :descriptors, :dependent => :destroy
  accepts_nested_attributes_for :notes, :allow_destroy => true, :reject_if => lambda { |a| a[:content].blank? }

  # before_create :check_number_of_contacts

  comma do
    first_name 'first_name'
    last_name 'last_name'
    company 'company'
    email 'email'
    personal_email 'personal_email'
    phone 'phone'
    cell 'cell'
    street_address 'street_address'
    city 'city'
    state 'state'
    zip 'zip'
    website 'website'
    linkedin 'linkedin'
    twitter 'twitter'
  end



  belongs_to :cracker
  has_many :cheeses, :through => :cracker

  pg_search_scope :tag_search, :associated_against => {
    :tags => [:name]
  }
  pg_search_scope :note_search, :associated_against => {
    :notes => [:content]
  }
  pg_search_scope :search_by_contact_info, :against => [:first_name, :last_name, :company, :title]


  def self.import(file,user,group)
    CSV.foreach(file.path, headers: true) do |row|
      @contact = Contact.create! row.to_hash
      @contact.user_id = user.id
      @contact.group_id = group.id
      @contact.save
    end
  end

  def self.example
    @contact = Contact.new
    @contact.first_name = "John"
    @contact.last_name = "Doe"
    @contact.company = "LaunchPad Lab"
    @contact.email = "john@example.com"
    @contact.personal_email = "johndoe@example.com"
    @contact.phone = '800-000-0000'
    @contact.cell = '800-000-0000'
    @contact.street_address = '100 W. High St.'
    @contact.city = 'Chicago'
    @contact.state = 'IL'
    @contact.zip = "60661"
    @contact.website = "www.launchpadlab.com"
    @contact.linkedin = "ryanpfrancis"
    @contact.twitter = "launchpadlab"
    return @contact
  end

  #Instance Methods
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def mailchimp_email
    return email if email.present?
    return personal_email if personal_email.present?
    return nil
  end

  private

    def check_number_of_contacts
      if user.check_number_of_contacts == User.new_plan_needed
        redirect_to new_subscription_path
      end
    end

end
