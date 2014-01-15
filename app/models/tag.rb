class Tag < ActiveRecord::Base
  attr_accessible :name, :group_id

  validates_presence_of :name, :group_id

  belongs_to :group
  has_many :contacts, :through => :descriptors
  has_many :descriptors, :dependent => :destroy

  def self.process_tags(args = {})
    tag_names = args[:tag_names].split(",")
    group = args[:group]
    contact = args[:contact] || Contact.find_by_id(args[:contact_id])
    tag_names.each do |tag_name|
      tag = group.tags.where(:name => tag_name).first || group.tags.create(name: tag_name)
      # descriptor joins a tag to a contact
      contact.present? ? (tag.descriptors.where(contact_id: contact.id).first || Descriptor.create(tag_id: tag.id, contact_id: contact.id)) : next
    end
  end

end
