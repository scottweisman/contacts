class Tag < ActiveRecord::Base
  attr_accessible :name, :user_id, :group_id

  validates_presence_of :name, :user_id, :group_id

  belongs_to :group
  belongs_to :user
  has_many :contacts, :through => :descriptors
  has_many :descriptors, :dependent => :destroy

  def self.process_tags(args = {})
    tag_names = args[:tag_names].split(",")
    user = args[:user]
    contact = args[:contact] || Contact.find_by_id(args[:contact_id])
    tag_names.each do |tag_name|
      tag = (user.tags.where(:name => tag_name).first || Tag.create(name: tag_name, user_id: user.id, group_id: user.group.id))
      # descriptor joins a tag to a contact
      contact.present? ? (tag.descriptors.where(contact_id: contact.id).first || Descriptor.create(tag_id: tag.id, contact_id: contact.id)) : next
    end
  end

end
