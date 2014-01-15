class Tag < ActiveRecord::Base
  attr_accessible :name, :group_id

  validates_presence_of :name, :group_id

  belongs_to :group
  has_many :contacts, :through => :descriptors
  has_many :descriptors, :dependent => :destroy

  def self.find_or_create(params = {})
    tag_name = params[:tag_name]
    group = params[:group]
    group.tags.where(:name => tag_name).first || group.tags.create(name: tag_name)
  end

  def self.process_tags(args = {})
    tag_names = args[:tag_names].split(",")
    group = args[:group]
    contact = args[:contact] || Contact.find_by_id(args[:contact_id])
    tag_names.each do |tag_name|
      tag = Tag.find_or_create(tag_name: tag_name, group: group)
      # descriptor joins a tag to a contact
      contact.present? ? tag.find_or_create_descriptor(contact: contact) : next
    end
  end

  #Instance Methods
  def find_or_create_descriptor(params = {})
    contact = params[:contact]
    descriptors.where(contact_id: contact.id).first || descriptors.create(contact_id: contact.id)
  end

end
