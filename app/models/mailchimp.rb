class Mailchimp < ActiveRecord::Base
  attr_accessible :group_id, :list_id, :list_name, :tag_id, :subscribe_method

  belongs_to :group

  after_save :subscribe_all_contacts, :if => :subscribe_all?
  after_save :add_tag, :if => :subscribe_tagged?

  def self.subscribe_all
    "all"
  end

  def self.subscribe_tagged
    "tag"
  end

  def self.subscribe_none
    "off"
  end

  def subscribe_all?
    subscribe_method == Mailchimp.subscribe_all
  end

  def subscribe_tagged?
    subscribe_method == Mailchimp.subscribe_tagged
  end

  def subscribe_all_contacts
    if self.subscribe_method == Mailchimp.subscribe_all
      self.group.contacts.each do |contact|
        if contact.mailchimp_email.present?
          contact.subscribe_to_mailchimp_list(self)
          tag = Tag.find_or_create(tag_name: list_name, group: group)
          descriptor = tag.find_or_create_descriptor(contact: contact)
        end
      end
    end
  end

  private

    def add_tag
      group.tags.where(name: list_name).first || Tag.create(name: list_name, group_id: group_id)
    end

end
