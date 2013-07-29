class Mailchimp < ActiveRecord::Base
  attr_accessible :group_id, :list_id, :list_name, :tag_id, :subscribe_method

  belongs_to :group

  after_save :subscribe_all_contacts

  def subscribe_all_contacts
    if self.subscribe_method == "all"
      gb = Gibbon::API.new(self.group.mailchimp)
      self.group.contacts.each do |contact|
        gb.lists.subscribe({:id => self.list_id, :email => {:email => contact.email}, :merge_vars => {:FNAME => contact.first_name, :LNAME => contact.last_name}, :double_optin => false})
      end
    end
  end

end
