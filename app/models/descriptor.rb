class Descriptor < ActiveRecord::Base
  attr_accessible :contact_id, :tag_id

  belongs_to :tag
  belongs_to :contact

  after_create :subscribe_to_list, :if => :subscribable?
  before_destroy :unsubscribe_from_list, :if => :subscribed?

  def find_mailchimp_list
    contact.group.mailchimps.where(:list_name => tag.name).first
  end

  def subscribable?
    list = find_mailchimp_list
    (list && list.subscribe_tagged? && contact.mailchimp_email).present?
  end

  def subscribed?
    find_mailchimp_list.present?
  end

  def subscribe_to_list
    list = find_mailchimp_list
    gb = Gibbon::API.new(contact.group.mailchimp)
    gb.lists.subscribe({:id => list.list_id, :email => {:email => contact.email}, :merge_vars => {:FNAME => contact.first_name, :LNAME => contact.last_name}, :double_optin => false})
  end

  def unsubscribe_from_list
    list = find_mailchimp_list
    gb = Gibbon::API.new(contact.group.mailchimp)
    gb.lists.unsubscribe(id: list.list_id, email: { email: contact.email }, delete_member: true)
  end

end
