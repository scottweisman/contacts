class Descriptor < ActiveRecord::Base
  attr_accessible :contact_id, :tag_id

  belongs_to :tag
  belongs_to :contact

  after_create :subscribe_contact

  def subscribe_contact
    if self.contact.group.mailchimps.where(:list_name => self.tag.name).count > 0
      list = self.contact.group.mailchimps.where(:list_name => self.tag.name).first
      if list.subscribe_method == 'tag'
        contact_to_add = Contact.find_by_id(self.contact_id)
        subscribe_to_list(list, contact_to_add)
      end
    end
  end

  def subscribe_to_list(list, contact_to_add)
    gb = Gibbon::API.new(self.contact.group.mailchimp)
    gb.lists.subscribe({:id => list.list_id, :email => {:email => contact.email}, :merge_vars => {:FNAME => contact.first_name, :LNAME => contact.last_name}, :double_optin => false})
  end
end
